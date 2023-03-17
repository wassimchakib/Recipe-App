class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  validates :name, presence: { message: 'Please enter a name' }, length: { minimum: 2 }
  validates :description, length: { maximum: 1000, message: 'The description is too long' }

  def total_price
    recipe_foods.map(&:total_price).sum
  end
end
