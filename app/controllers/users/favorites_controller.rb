class Users::FavoritesController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    favorite = @recipe.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    favorite.destroy
  end

  private
  def redirect
    case params[:redirect_id].to_i
    when 0
      redirect_to users_recipes_path
    when 1
      redirect_to users_recipe_path(@recipe)
    end
  end
end
