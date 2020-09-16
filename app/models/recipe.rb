class Recipe < ApplicationRecord
  belongs_to :genre
  attachment :image
end
