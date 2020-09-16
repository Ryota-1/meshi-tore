class Users::RecipesController < ApplicationController

  before_action :set_genres

  def new
  	@recipe = Recipe.new
  end

  def create
  	@recipe = Recipe.new(recipe_params)
  	@recipe.save
  	redirect_to users_recipes_path
  end

  def index
  	@recipes = Recipe.all
  end

  def edit
  	@recipe = Recipe.find(params[:id])
  end

  def update
  	@recipe = Recipe.find(params[:id])
  	@recipe.update(recipe_params)
  	redirect_to users_recipe_path(@recipe.id)
  end

  def destroy
  	@recipe.destroy
  	redirect_to users_recipes_path
  end

  private

  def recipe_params
  	params.require(:recipe).permit(:name, :ingredient, :how_to_cook, :pfc, :image_id)
  end

  def set_genres
  	@genres = Genre.where(is_active: true)
  end
end
