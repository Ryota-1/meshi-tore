class Users::UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @recipes = @user.recipes
  end

  def withdraw
  	@user = User.find(params[:id])
  	@user.update(is_deleted: true)
  	reset_session
  	redirect_to root_path
  end

  def withdraw_confirm
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  	@user = current_user
  end

  def update
  	@user = User.find(params[:id])
    @user.score = Language.get_data(user_params[:introduction])
  	if @user.update(user_params)
  		redirect_to user_path(@user.id)
  	else
  		render 'edit'
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image, :email, :is_deleted)
  end
end