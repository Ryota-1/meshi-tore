class Users::RecipeCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    recipe = Recipe.find(params[:recipe_id])
    comment = current_user.recipe_comments.new(recipe_comment_params)
    comment.recipe_id = recipe.id
    comment.save
    redirect_to users_recipe_path(recipe)
  end

  def destroy

  end

  private

  def recipe_comment_params
    params.require(:recipe_comment).permit(:comment)
  end
end
