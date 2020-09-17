class Users::UsersController < ApplicationController

  before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@user = current_user
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
  	if @user.update(user_params)
  		redirect_to user_path(@user.id)
  	else
  		render 'edit'
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image, :email)
  end

  def correct_user
  	user = User.find(params[:id])
  	if current_user != user
  		redirect_to new_user_registration_path
  	end
  end
end