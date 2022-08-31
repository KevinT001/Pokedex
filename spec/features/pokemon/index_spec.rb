require 'rails_helper'

RSpec.describe 'pokemon index' do 
  it ' i can see the name of each child' do 
    johto = Region.create!(name: "Johto", total_num_in_region: 151, caught_all_in_region: false)
    psyduck =johto.pokemons.create!(name:"Psyduck", pokemon_weight: 43, has_evolution: true)
    metapod =johto.pokemons.create!(name:"Metapod", pokemon_weight: 22, has_evolution: true)

    visit "/pokemons" 

    expect(page).to have_content(psyduck.name)
    expect(page).to have_content(metapod.name)
    expect(page).to have_content(psyduck.pokemon_weight)
    expect(page).to have_content(metapod.pokemon_weight)
    expect(page).to have_content(psyduck.has_evolution)
    expect(page).to have_content(metapod.has_evolution)

  end

  describe 'when I visit any page on the site' do
    describe 'I see a link at the top of the page that takes me to the pokemon index' do #STORY 8
      it 'has a link to pokemons index on the top of each page' do
        visit '/'
        expect(page).to have_link("Pokemon page")
        click_on "Pokemon page"
        expect(current_path).to eq(pokemons_path(@pokemons))

        visit '/regions'
        expect(page).to have_link("Pokemon page")
        click_on "Pokemon page"
        expect(current_path).to eq(pokemons_path(@pokemons))
      end 
    end 
  end 
end

