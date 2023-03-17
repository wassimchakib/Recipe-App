require 'rails_helper'

RSpec.describe 'Foods new', type: :system do
  let :user do
    User.find_or_create_by(email: 'test@microverse.org') do |user|
      user.name = 'micronaut'
      user.password = Devise.friendly_token.first(8)
      user.confirmed_at = Time.now
    end
  end

  before(:each) do
    login_as(user)
  end

  it 'fills the form and submits' do
    visit new_food_path
    fill_in 'Name', with: 'Olive Oil'
    fill_in 'Price', with: 200
    fill_in 'Quantity', with: 5
    fill_in 'Measurement unit', with: 'l'
    click_button 'Add'
    expect(page).to have_content('Olive Oil')
  end
end
