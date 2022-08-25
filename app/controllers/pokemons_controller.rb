class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all

  end

  def show 
    @pokemons = Pokemon.find(params[:id])
  end
end