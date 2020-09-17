class Users::RecipesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_genres

  def new
  	@recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to users_recipes_path
    else
      render :new
    end
  end

  def index
  	@recipes = Recipe.all
  end

  def show
  	@recipe = Recipe.find(params[:id])
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
  	params.require(:recipe).permit(:name, :ingredient, :how_to_cook, :pfc, :image, :genre_id, :user_id)
  end

  def set_genres
  	@genres = Genre.where(is_active: true)
  end
end
