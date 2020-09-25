class Admins::RecipesController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_genres

  def index
  	@recipes = Recipe.all
  end

  def show
  	@recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
  	params.require(:recipe).permit(:name, :ingredient, :how_to_cook, :pfc, :image, :genre_id)
  end

  def set_genres
  	@genres = Genre.where(is_active: true)
  end
end
