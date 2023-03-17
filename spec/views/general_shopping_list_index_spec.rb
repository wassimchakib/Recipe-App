require 'rails_helper'

RSpec.describe 'Shopping list', type: :system do
  let :user do
    User.find_or_create_by(email: 'wassimchakib@gmail.com') do |user|
      user.name = 'wassim'
      user.password = Devise.friendly_token.first(8)
      user.confirmed_at = Time.now
    end
  end

  let(:recipe) do
    Recipe.create!(user:, name: 'My First Recipe', preparation_time: '15 min', cooking_time: '45 min',
                   public: true, description: 'This is the description of recipe')
  end

  let(:food) { Food.create!(name: 'Chicken Breast', measurement_unit: 'Kg', price: 200, quantity: 2, user:) }

  let(:recipe_food) { RecipeFood.create!(food:, recipe:, quantity: 4) }

  before(:each) do
    login_as(user)
    recipe
    food
    recipe_food
  end

  describe 'index page' do
    it 'shows the title of the page' do
      visit recipe_general_shopping_list_path(recipe.id)
      expect(page).to have_content('Shopping List')
    end

    it 'shows the amount of food items to buy' do
      visit recipe_general_shopping_list_path(recipe.id)
      expect(page).to have_content('Amount of food items to buy:')
    end

    it 'shows the total value of food needed' do
      visit recipe_general_shopping_list_path(recipe.id)
      expect(page).to have_content('Total Value of food needed:')
    end

    it 'Shows the list of food to shop' do
      visit recipe_general_shopping_list_path(recipe.id)
      expect(page).to have_content('Food')
      expect(page).to have_content('Chicken Breast')
    end

    it 'Shows the quantity of food to buy' do
      visit recipe_general_shopping_list_path(recipe.id)
      expect(page).to have_content('Quantity')
      expect(page).to have_content('2.0 Kg')
    end

    it 'Shows the price of each food to buy' do
      visit recipe_general_shopping_list_path(recipe.id)
      expect(page).to have_content('Price')
      expect(page).to have_content('200.0')
    end
  end
end
