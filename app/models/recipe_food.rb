class RecipeFood < ApplicationRecord
  belongs_to :recipe
  has_many :foods
end
