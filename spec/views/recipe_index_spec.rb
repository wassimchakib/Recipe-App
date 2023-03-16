require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'index page' do
    before(:each) do
      @user = User.find_by(email: 'wassimchakib@gmail.com')
      @user.password = '123456'
      @user.skip_confirmation!
      sleep 600
    end

    it 'shows the title of each recipe' do
      visit recipes_path
      expect(page).to have_content('Grilled Basil Chicken')
      expect(page).to have_content('Miso Marinated Short Ribs')
    end
  end
end