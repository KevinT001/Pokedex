require 'rails_helper'

RSpec.describe Region, type: :model do
  # binding.pry
  describe "validations" do 
    it { should have_many(:pokemons)}

    it { should validate_presence_of :name}
    it { should validate_presence_of :total_num_in_region}
    it { should allow_value(true).for(:caught_all_in_region)}
    it { should allow_value(false).for(:caught_all_in_region)}
  end 

  it 'can order regions by the date most recently created' do # STORY 6
    johto = Region.create!(name: "Johto", total_num_in_region: 151, caught_all_in_region: false, created_at: 10.seconds.ago)
    sinoh = Region.create!(name: "Sinnoh", total_num_in_region: 301, caught_all_in_region: true, created_at: 5.seconds.ago )
    psyduck = johto.pokemons.create!(name:"Psyduck", pokemon_weight: 43, has_evolution: true)
    pikachu = johto.pokemons.create!(name: "Pikachu", pokemon_weight: 13, has_evolution: true )


    expect(Region.order_by_creation).to eq([sinoh, johto])
  end

  it 'can count the number of pokemons each region has' do  #STORY 7
    johto = Region.create!(name: "Johto", total_num_in_region: 151, caught_all_in_region: false, created_at: 10.seconds.ago)
    sinoh = Region.create!(name: "Sinnoh", total_num_in_region: 301, caught_all_in_region: true, created_at: 5.seconds.ago )
    psyduck = johto.pokemons.create!(name:"Psyduck", pokemon_weight: 43, has_evolution: true)
    pikachu = johto.pokemons.create!(name: "Pikachu", pokemon_weight: 13, has_evolution: true )

    expect(johto.pokemons_count).to eq(2)
    expect(sinoh.pokemons_count).to eq(0)
  end


end