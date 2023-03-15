class RecipeFood < ApplicationRecord
  belongs_to :recipe
  has_many :foods
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
