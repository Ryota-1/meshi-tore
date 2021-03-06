class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @search = Recipe.ransack(params[:q])
    @recipes = @search.result.page(params[:page])
  end

	protected

	def after_sign_in_path_for(resource)
    case resource
    when User
      users_recipes_path(current_user)
    when Admin
      admins_genres_path
    end
  end

  def after_sign_up_path_for(resource)
    users_recipes_path(current_user)
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    else
      root_path
    end
  end

	def configure_permitted_parameters
  	  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
end
