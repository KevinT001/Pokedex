require 'rails_helper'
RSpec.describe 'Region Show page' do 
  it 'shows a specific parent attributes' do 
    johto = Region.create!(name: "Johto", total_num_in_region: 151, caught_all_in_region: false)
    sinoh = Region.create!(name: "Sinnoh", total_num_in_region: 301, caught_all_in_region: true)

    visit "/regions/#{johto.id}"

    expect(page).to have_content(johto.name)
    expect(page).to have_content(johto.caught_all_in_region)
    expect(page).to have_content(johto.total_num_in_region)
    expect(page).to_not have_content(sinoh.name)
  end
  describe 'I see a link to take me to that regions pokemon page' do
      it 'has a link that goes to its pokemonss' do
        johto = Region.create!(name: "Johto", total_num_in_region: 151, caught_all_in_region: false)
        sinoh = Region.create!(name: "Sinnoh", total_num_in_region: 301, caught_all_in_region: true)

        visit "/regions/#{@region.id}"
        expect(page).to have_link("Registered Johto Pokemons")
        click_on "Registered Johto Pokemons"
        expect(current_path).to eq("/regions/#{@region.id}/pokemons")
      end
    end
end