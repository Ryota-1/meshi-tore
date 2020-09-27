class Users::RecipeCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_new = Recipe.new
    @recipe_comment = @recipe.recipe_comments.new(recipe_comment_params)
    @recipe_comment.user_id = current_user.id
    if @recipe_comment.save
      flash[:success] = "Comment was successfully created."
    else
      @recipe_comments = RecipeComment.where(id: @recipe)
    end
  end

  def destroy
    @recipe_comment = RecipeComment.find(params[:recipe_id])
    @recipe = @book_comment.book
    if @recipe_comment.user != current_user
      redirect_to request.referer
    end
    @recipe_comment.destroy
  end

  private

  def recipe_comment_params
    params.require(:recipe_comment).permit(:comment)
  end
end
