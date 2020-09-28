class Users::RecipesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_genres
  before_action :ensure_correct_user, only: [:edit, :update]

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
  	@recipes = Recipe.page(params[:page]).per(8)
    @search = Recipe.ransack(params[:q])
    @recipes = @search.result.page(params[:page])
  end

  def show
  	@recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
  end

  def edit
  	@recipe = Recipe.find(params[:id])
  end

  def update
  	@recipe = Recipe.find(params[:id])
    @recipe.user_id = current_user.id
  	@recipe.update(recipe_params)
  	redirect_to users_recipe_path(@recipe.id)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
  	@recipe.destroy
  	redirect_to users_recipes_path
  end

  def genre_recipes
  	@recipes = Recipe.where(genre_id: params[:id]).page(params[:page]).per(8)
  	@genres = Genre.where(is_active: true)
  end


  private

  def recipe_params
  	params.require(:recipe).permit(:name, :ingredient, :how_to_cook, :pfc, :image, :genre_id)
  end

  def set_genres
  	@genres = Genre.where(is_active: true)
  end

  def ensure_correct_user
    @recipe = Recipe.find(params[:id])
    unless @recipe.user == current_user
      redirect_to users_recipes_path
    end
  end
end
