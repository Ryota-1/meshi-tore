class HomesController < ApplicationController

  def top
  	@recipes = Recipe.order("RANDOM()").limit(4)
  	@genres = Genre.where(is_active: true)
  end

  def about
  end
end
