require 'rails_helper'

RSpec.describe Food, type: :model do
  let :user do
    User.find_or_create_by(email: 'test@microverse.org') do |user|
      user.name = 'micronaut'
      user.password = Devise.friendly_token.first(8)
      user.confirmed_at = Time.now
    end
  end

  let :food do
    Food.find_or_create_by(name: 'Olive Oil', measurement_unit: 'l', price: 200, quantity: 5, user: user)
  end

  it 'fails because name should be present' do
    food.name = nil
    expect(food).to_not be_valid
  end

  it 'fails because price should be present' do
    food.price = nil
    expect(food).to_not be_valid
  end

  it 'fails because price should be greater than 0' do
    food.price = -1
    expect(food).to_not be_valid
  end

  it 'fails because quantity should be present' do
    food.quantity = nil
    expect(food).to_not be_valid
  end

  it 'fails because quantity should be greater than 0' do
    food.quantity = -1
    expect(food).to_not be_valid
  end
end
