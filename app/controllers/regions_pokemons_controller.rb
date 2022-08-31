class RegionsPokemonsController < ApplicationController
  def index  
    @regions = Region.find(params[:id]) 
    @pokemons = @regions.pokemons
  end 
end 