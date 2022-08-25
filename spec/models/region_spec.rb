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


end