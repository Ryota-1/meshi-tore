class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  attachment :image
  has_many :favorites
  has_many :recipe_comments
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
