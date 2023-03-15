class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  validates :name, presence: { message: 'Please enter a name' }, length: { minimum: 2 }
  validates :description, length: { maximum: 1000, message: 'The description is too long' }
end
