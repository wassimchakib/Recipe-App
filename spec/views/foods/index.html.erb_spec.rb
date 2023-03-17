require 'rails_helper'

RSpec.describe 'Foods index', type: :system do
  before(:each) do
    user = User.find_or_create_by(email: 'test@microverse.org') do |user|
      user.name = 'micronaut'
      user.password = Devise.friendly_token.first(8)
      user.confirmed_at = Time.now
    end

    food = Food.find_or_create_by(name: 'Olive Oil', measurement_unit: 'l', price: 200, quantity: 5, user: user)

    login_as(user)
  end

  it 'shows the Add Food button' do
    visit foods_path
    expect(page).to have_link('Add Food')
  end

  it 'leads to the Add Food page' do
    visit foods_path
    click_link('Add Food')
    expect(page).to have_content('Add Food')
  end

  it 'shows the Food Name' do
    visit foods_path
    expect(page).to have_content('Olive Oil')
  end

  it 'shows the Food Price' do
    visit foods_path
    expect(page).to have_content("$200")
  end

  it 'shows the Food Quantity' do
    visit foods_path
    expect(page).to have_content('5')
  end

  it 'shows the Food Measurement Unit' do
    visit foods_path
    expect(page).to have_content('l')
  end

  it 'shows the Food Delete links' do
    visit foods_path
    expect(page).to have_link('Delete')
  end
end
