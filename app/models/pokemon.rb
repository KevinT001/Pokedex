class Pokemon < ApplicationRecord
belongs_to :region 
validates_presence_of :name 
validates_presence_of :pokemon_weight
validates :has_evolution, inclusion:[true, false]
end