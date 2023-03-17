require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  let(:user) do
    User.find_by(email: 'wassimchakib@gmail.com')
  end
  describe 'index page' do
    before(:each) do
      user.skip_confirmation!
      login_as(user)
    end

    it 'shows the title of each recipe' do
      visit recipes_path
      expect(page).to have_content('Grilled Basil Chicken')
    end

    it 'shows the description of each recipe' do
      visit recipes_path
      expect(page).to have_content('Wash hands with soap and water.')
    end

    it 'has delete button' do
      visit recipes_path
      expect(page).to have_content('Delete')
    end

    it 'has add recipe button' do
      visit recipes_path
      expect(page).to have_content('Add Recipe')
    end
  end
end
