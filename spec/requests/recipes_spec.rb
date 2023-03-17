require 'rails_helper'

RSpec.describe 'RecipesController', type: :request do
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

  before(:each) do
    login_as(user)
    recipe
  end

  describe 'GET /recipes/' do
    # Get lists of all recipes
    it 'returns a 200 status response' do
      get recipes_path
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /recipes/:recipe_id' do
    # Get Specific Recipe
    it 'returns a 200 status response' do
      get recipe_path(recipe.id)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end
