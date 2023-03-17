class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  def total_price
    food.total_price * quantity
  end
end
