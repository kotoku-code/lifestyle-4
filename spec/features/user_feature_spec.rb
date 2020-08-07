# require 'rails_helper'
# require 'capybara/rails'

# # rubocop:disable Metrics/BlockLength:
# feature 'user features ', type: :feature do
#   feature 'create a new user' do
#     before(:each) do
#       visit 'users/new'
#     end

  #   scenario 'with invalid params' do
  #     fill_in 'user[name]', with: 'P'
  #     click_on 'Create User'
  #     expect(page).to have_content('Name is too short')
  #   end

  #   scenario 'with valid params' do
  #     fill_in 'user[name]', with: 'Capos'
  #     attach_file('user[avatar]', Rails.root + 'app/assets/images/8904a4a44249bdee8ebd968bd0e74bcb_400x400.jpeg')
  #     click_on 'Create User'
  #     expect(page).to have_content('User was successfully created.')
  #   end
  # end

  # feature 'sign in' do
  #   before(:each) do
  #     visit 'users/new'
  #     fill_in 'user[name]', with: 'Capos'
  #     attach_file('user[avatar]', Rails.root + 'app/assets/images/8904a4a44249bdee8ebd968bd0e74bcb_400x400.jpeg')
  #     click_on 'Create User'
  #     click_on 'Log out'
  #     visit '/login'
  #   end

  #   scenario 'with invalid params' do
  #     fill_in 'session[name]', with: 'P'
  #     click_button 'Log in'
  #     expect(page).to have_content('Bad name. Try again.')
  #   end

  #   scenario 'with valid params' do
  #     fill_in 'session[name]', with: 'Capos'
  #     click_button 'Log in'
  #     expect(page).to have_content('Capos')
  #   end
  # end
  # rubocop:enable Metrics/BlockLength:
# 

require 'rails_helper'
RSpec.describe 'authentication', type: :feature do
  let(:user) { FactoryBot.build(:user) }

  feature 'Sign up' do
    scenario 'Sign Up with valid params' do
      visit root_path
      find('#submit').click
      fill_in 'Username', with: user.username
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      fill_in 'Password confirmation', with: 'foobar'
      find('#submit').click
      expect(page).to have_content(user.username)
    end
  end

  feature 'Valid Sign up' do
    scenario 'Sign Up with invalid username' do
      visit root_path
      find('#submit').click
      fill_in 'Username', with: ' '
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      fill_in 'Password confirmation', with: 'foobar'
      find('#submit').click
      expect(page).to have_content("Username can't be blank")
    end

    scenario 'Invalid Sign Up with invalid email' do
      visit root_path
      find('#submit').click
      fill_in 'Username', with: user.username
      fill_in 'Email', with: ' '
      fill_in 'Password', with: 'foobar'
      fill_in 'Password confirmation', with: 'foobar'
      find('#submit').click
      expect(page).to have_content("Email can't be blank")
    end

    scenario 'Sign Up with invalid password' do
      visit root_path
      find('#submit').click
      fill_in 'Username', with: user.username
      fill_in 'Email', with: user.email
      fill_in 'Password', with: ' '
      fill_in 'Password confirmation', with: 'foobar'
      find('#submit').click
      expect(page).to have_content("Password can't be blank")
    end
  end

  feature 'Sign In' do
    scenario 'Sign Up with valid params' do
      visit root_path
      find('#login').click
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'foobar'
      find('#login').click
      expect(page).to have_content('Invalid Email or password')
    end

    scenario 'Sign Up with invalid email' do
      visit root_path
      find('#login').click
      fill_in 'Email', with: ' '
      fill_in 'Password', with: 'foobar'
      find('#login').click
      expect(page).to have_content('Invalid Email or password')
    end

    scenario 'Sign Up with invalid password' do
      visit root_path
      find('#login').click
      fill_in 'Email', with: user.email
      fill_in 'Password', with: ' '
      find('#login').click
      expect(page).to have_content('Invalid Email or password')
    end
  end
end