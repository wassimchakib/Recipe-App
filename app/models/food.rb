class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, presence: true, length: { minimum: 3 }
<<<<<<< HEAD
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
=======

  def total_price
    price * quantity
  end
>>>>>>> feat/recipe
end
