class HomesController < ApplicationController

  def top
  	@recipes = Recipe.order("RAND()").limit(4)
  	@genres = Genre.where(is_active: true)
  end

  def about
  end
end
