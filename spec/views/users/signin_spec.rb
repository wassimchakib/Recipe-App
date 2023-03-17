require 'rails_helper'

RSpec.describe 'Sign in page', type: :system do
  it 'fills the Sign in form and submits' do
    User.find_or_create_by(email: 'test@microverse.org') do |user|
      user.name = 'micronaut'
      user.encrypted_password = Devise::Encryptor.digest(User, 'password1234')
      user.confirmed_at = Time.now
    end

    visit root_path
    fill_in 'Email', with: 'test@microverse.org'
    fill_in 'Password', with: 'password1234'
    find('input[name="commit"]').click
    expect(page).to have_content('Signed in successfully.')
  end
end
