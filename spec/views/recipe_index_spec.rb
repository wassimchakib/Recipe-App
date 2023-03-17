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
    Recipe.create!(user:, name: 'My First Recipe', preparation_time: '15 min', cooking_time: '45 min', public: true,
                   description: 'This is the description of recipe')
  end

  before(:each) do
    login_as(user)
  end

  describe 'index page' do
    it 'shows the title of each recipe' do
      recipe
      visit recipes_path
      expect(page).to have_content('My First Recipe')
    end

    it 'shows the description of each recipe' do
      recipe
      visit recipes_path
      expect(page).to have_content('This is the description of recipe')
    end

    it 'has delete button' do
      recipe
      visit recipes_path
      expect(page).to have_content('Delete')
    end

    it 'has add recipe button' do
      recipe
      visit recipes_path
      expect(page).to have_content('Add Recipe')
    end
  end
end
