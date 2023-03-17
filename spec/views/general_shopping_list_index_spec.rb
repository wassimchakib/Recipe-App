require 'rails_helper'

RSpec.describe 'Shopping list', type: :system do
  let(:user) do
    User.find_by(email: 'wassimchakib@gmail.com')
  end
  describe 'index page' do
    before(:each) do
      user.skip_confirmation!
      login_as(user)
    end

    it 'shows the title of the page' do
      visit recipe_general_shopping_list_path(1)
      expect(page).to have_content('Shopping List')
    end

    it 'shows the amount of food items to buy' do
      visit recipe_general_shopping_list_path(1)
      expect(page).to have_content('Amount of food items to buy:')
    end

    it 'shows the total value of food needed' do
      visit recipe_general_shopping_list_path(1)
      expect(page).to have_content('Total Value of food needed:')
    end

    it 'Shows the list of food to shop' do
      visit recipe_general_shopping_list_path(1)
      expect(page).to have_content('Food')
      expect(page).to have_content('Chicken Breast')
    end

    it 'Shows the quantity of food to buy' do
      visit recipe_general_shopping_list_path(1)
      expect(page).to have_content('Quantity')
      expect(page).to have_content('2.0Kg')
    end

    it 'Shows the price of each food to buy' do
      visit recipe_general_shopping_list_path(1)
      expect(page).to have_content('Price')
      expect(page).to have_content('49.99')
    end
  end
end
