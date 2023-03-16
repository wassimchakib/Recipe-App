require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:wassim) { User.new(name: 'wassim', email: 'wassimchakib@gmail.com', password: 'a1234cyf') }
  let(:olive_oil) { Food.new(name: 'Olive Oil', measurement_unit: 'l', price: 200, quantity: 5, user: wassim) }
  let(:recipe) do
    Recipe.new(name: 'Miso Marinated Short Ribs', preparation_time: '25 min', cooking_time: '20 min',
               description: 'Description of recipe', public: false, user: wassim)
  end
  let(:recipe_food) { RecipeFood.new(quantity: 2, recipe:, food: olive_oil) }
  it 'fails because quantity should be present' do
    recipe_food.quantity = nil
    expect(recipe_food).to_not be_valid
  end

  it 'fails because quantity is a negative value' do
    recipe_food.quantity = -5
    expect(recipe_food).to_not be_valid
  end

  it 'fails because recipe was not provided' do
    recipe_food.recipe = nil
    expect(recipe_food).to_not be_valid
  end

  it 'fails because food was not provided' do
    recipe_food.food = nil
    expect(recipe_food).to_not be_valid
  end
end
