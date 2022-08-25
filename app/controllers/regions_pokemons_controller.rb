class RegionsPokemonController < ApplicationController
  def index  
    @region = Region.find(params[:id]) 
    @pokemons = @region.pokemon
  end 
end 