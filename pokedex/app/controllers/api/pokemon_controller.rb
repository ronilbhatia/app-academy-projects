class Api::PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find_by(id: params[:id])
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:attack, :defense, :image_url, :name, :poke_type)
  end
end
