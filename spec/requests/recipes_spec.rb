require 'rails_helper'

RSpec.describe 'RecipesController', type: :request do
  describe 'GET /recipes/' do
    before(:all) do
      user = User.find_by(email: 'wassimchakib@gmail.com')
      user.skip_confirmation!
      login_as(user)
      get recipes_path
    end

    # Get lists of all recipes
    it 'returns a 200 status response' do
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /recipes/:recipe_id' do
    before(:all) do
      user = User.find_by(email: 'wassimchakib@gmail.com')
      user.skip_confirmation!
      login_as(user)
      get recipe_path(1)
    end

    # Get Specific Recipe
    it 'returns a 200 status response' do
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end