require 'rails_helper'

RSpec.describe Pokemon, type: :model do

  it { should belong_to :region}

  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:pokemon_weight)}
  it { should allow_value(true).for(:has_evolution)}
  it { should allow_value(false).for(:has_evolution)}
end