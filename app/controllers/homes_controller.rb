class HomesController < ApplicationController

  def top
  	@recipes = Recipe.where( 'id >= ?', rand(Recipe.first.id..Recipe.last.id)).limit(4)
  	@genres = Genre.where(is_active: true)
  end

  def about
  end
end
