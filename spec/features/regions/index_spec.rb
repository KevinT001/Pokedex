require 'rails_helper'

RSpec.describe 'Region index page' do 
  it 'I see the name of each parent' do 
    johto = Region.create!(name: "Johto", total_num_in_region: 151, caught_all_in_region: false)
    sinoh = Region.create!(name: "Sinnoh", total_num_in_region: 301, caught_all_in_region: true )

    visit "/regions"
  
    expect(page).to have_content(johto.name)
    expect(page).to have_content(sinoh.name)
    expect(page).to have_content(johto.total_num_in_region)
    expect(page).to have_content(sinoh.total_num_in_region)
    expect(page).to have_content(johto.caught_all_in_region)
    expect(page).to have_content(sinoh.caught_all_in_region)
  end

  it 'I see that records are ordered by most recently created first' do  #STORY 6
    johto = Region.create!(name: "Johto", total_num_in_region: 151, caught_all_in_region: false, created_at: 10.seconds.ago)
    sinoh = Region.create!(name: "Sinnoh", total_num_in_region: 301, caught_all_in_region: true, created_at: 5.seconds.ago )
    psyduck = johto.pokemons.create!(name:"Psyduck", pokemon_weight: 43, has_evolution: true)
    pikachu = johto.pokemons.create!(name: "Pikachu", pokemon_weight: 13, has_evolution: true )


    visit "/regions"
    

    expect(sinoh.name).to appear_before(johto.name)
  end

  it 'will show next to each of the records when it was created' do #STORY 6 
    johto = Region.create!(name: "Johto", total_num_in_region: 151, caught_all_in_region: false)
    sinoh = Region.create!(name: "Sinnoh", total_num_in_region: 301, caught_all_in_region: true )
    psyduck = johto.pokemons.create!(name:"Psyduck", pokemon_weight: 43, has_evolution: true)
    pikachu = johto.pokemons.create!(name: "Pikachu", pokemon_weight: 13, has_evolution: true )

    visit "/regions"

    expect(page).to have_content(johto.created_at)
    expect(page).to have_content(sinoh.created_at)
  end
  describe 'when I visit any page on the site' do
    describe 'I see a link at the top of the page that takes me to the regions index' do #STORY 8

      it 'has a link to regions index on the top of each page' do
        johto = Region.create!(name: "Johto", total_num_in_region: 151, caught_all_in_region: false)
        sinoh = Region.create!(name: "Sinnoh", total_num_in_region: 301, caught_all_in_region: true )
        psyduck = johto.pokemons.create!(name:"Psyduck", pokemon_weight: 43, has_evolution: true)
        pikachu = johto.pokemons.create!(name: "Pikachu", pokemon_weight: 13, has_evolution: true )
          
        visit '/'
        expect(page).to have_link("Regions page")
        click_on "Regions page"
        expect(current_path).to eq(regions_path(@regions))

        visit '/pokemons'
        expect(page).to have_link("Regions page")
        click_on "Regions page"
        expect(current_path).to eq(regions_path(@regions))

        
      end 
    end 
  end
end 