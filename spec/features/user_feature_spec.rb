require 'rails_helper'

RSpec.describe 'signup page', type: :feature do
  before(:each) do
    visit new_user_registration_path
    fill_in 'Username', with: 'maggie'
    fill_in 'Email', with: 'kennedy@gmail.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully')
  end

  scenario 'çreating an article' do
    visit new_link_path
    expect(page).to have_content('Lifestyles')
  end
end
