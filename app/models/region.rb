class Region < ApplicationRecord

  has_many :pokemons 
  validates_presence_of :name
  validates_presence_of :total_num_in_region
  validates :caught_all_in_region, inclusion:[true, false]

end