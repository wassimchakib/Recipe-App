require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  let :user do
    User.find_or_create_by(email: 'wassimchakib@gmail.com') do |user|
      user.name = 'wassim'
      user.password = Devise.friendly_token.first(8)
      user.confirmed_at = Time.now
    end
  end

  let(:recipe) do
    Recipe.create!(user:, name: 'Grilled Basil Chicken', preparation_time: '10 min', cooking_time: '45 min',
                   public: true, description: 'Wash hands with soap and water.')
  end

  let(:food) { Food.create!(name: 'Olive Oil', measurement_unit: 'l', price: 49.99, quantity: 4, user:) }

  let(:recipe_food) { RecipeFood.create!(food:, recipe:, quantity: 20) }

  before(:each) do
    login_as(user)
    recipe
    food
    recipe_food
  end

  describe 'show page' do
    it 'shows the title of the recipe' do
      visit recipe_path(recipe.id)
      expect(page).to have_content('Grilled Basil Chicken')
    end

    it 'shows the Preparation time of the recipe' do
      visit recipe_path(recipe.id)
      expect(page).to have_content('Preparation time: 10 min')
    end

    it 'shows the Cooking time of the recipe' do
      visit recipe_path(recipe.id)
      expect(page).to have_content('Cooking time: 45 min')
    end

    it 'shows the description of the recipe' do
      visit recipe_path(recipe.id)
      expect(page).to have_content('Wash hands with soap and water.')
    end

    it 'has public button' do
      visit recipe_path(recipe.id)
      expect(page).to have_content('Public')
    end

    it 'has add ingredient button' do
      visit recipe_path(recipe.id)
      expect(page).to have_content('Add ingredient')
    end

    it 'has add generate shopping list button' do
      visit recipe_path(recipe.id)
      expect(page).to have_content('Generate Shopping list')
    end

    it 'shows name of each recipe foods' do
      visit recipe_path(recipe.id)
      expect(page).to have_content('Food')
      expect(page).to have_content('Olive Oil')
    end

    it 'shows the quantity of each recipe foods' do
      visit recipe_path(recipe.id)
      expect(page).to have_content('Quantity')
      expect(page).to have_content('20')
    end

    it 'shows the value or price of each recipe foods' do
      visit recipe_path(recipe.id)
      expect(page).to have_content('Value')
      expect(page).to have_content('49.99')
    end

    it 'shows the remove button of each recipe foods' do
      visit recipe_path(recipe.id)
      expect(page).to have_content('Actions')
      expect(page).to have_content('remove')
    end
  end
end
