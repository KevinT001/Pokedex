require 'rails_helper'

RSpec.describe 'pokemon index' do 
  it ' i can see the name of each child' do 
    johto = Region.create!(name: "Johto", total_num_in_region: 151, caught_all_in_region: false)
    psyduck =johto.pokemons.create!(name:"Psyduck", pokemon_weight: 43, has_evolution: true)
    metapod =johto.pokemons.create!(name:"Metapod", pokemon_weight: 22, has_evolution: true)

    visit "/regions/#{johto.id}/pokemons" 

    expect(page).to have_content(psyduck.name)
    expect(page).to have_content(metapod.name)
    expect(page).to have_content(psyduck.pokemon_weight)
    expect(page).to have_content(metapod.pokemon_weight)
    expect(page).to have_content(psyduck.has_evolution)
    expect(page).to have_content(metapod.has_evolution)

  end
end