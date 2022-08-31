class Region < ApplicationRecord

  has_many :pokemons 
  validates_presence_of :name
  validates_presence_of :total_num_in_region
  validates :caught_all_in_region, inclusion:[true, false]

  def self.order_by_creation #STORY 6
    self.order(created_at: :desc)
  end

  def pokemons_count #STORY 7
    self.pokemons.count
  end

end