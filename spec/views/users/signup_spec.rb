require 'rails_helper'

RSpec.describe 'Sign up page', type: :system do
  it 'fills the Sign up form and submits' do
    visit new_user_registration_path
    fill_in 'Name', with: 'micronaut'
    fill_in 'Email', with: 'test@microverse.org'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    find('input[name="commit"]').click
    expect(page).to have_content('Sign in')
  end
end
