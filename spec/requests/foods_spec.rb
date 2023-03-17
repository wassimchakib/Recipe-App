require 'rails_helper'

RSpec.describe 'FoodsController', type: :request do
  let :user do
    User.find_or_create_by(email: 'wassimchakib@gmail.com') do |user|
      user.name = 'wassim'
      user.password = Devise.friendly_token.first(8)
      user.confirmed_at = Time.now
    end
  end

  before(:each) do
    login_as(user)
  end

  describe 'GET /foods/' do
    # Get lists of all foods
    it 'returns a 200 status response' do
      get foods_path
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end
