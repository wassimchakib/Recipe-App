require 'rails_helper'

RSpec.describe User, type: :model do
  let :user do
    User.find_or_create_by(email: 'test@microverse.org') do |user|
      user.name = 'micronaut'
      user.password = Devise.friendly_token.first(8)
      user.confirmed_at = Time.now
    end
  end

  it 'fails because name should be present' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'fails because email should be present' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'fails because password should be present' do
    user.password = nil
    expect(user).to_not be_valid
  end
end
