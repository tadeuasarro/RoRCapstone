require 'rails_helper'

RSpec.describe 'Session Features', type: :feature do
  before :each do
  end

  scenario 'require login' do
    visit root_path
    expect(page).to have_content('You must login first!')
  end

  scenario 'require logout' do
    user1 = User.create(username: 'Tadeu', full_name: 'Tadeu Sarro')
    visit new_session_path
    fill_in 'user_username', with: user1.username
    click_button 'Login'

    visit new_session_path
    expect(page).to have_content('You must logout first!')
  end

  scenario 'try to login with an invalid account' do
    visit new_session_path
    fill_in 'user_username', with: 'Not an user'
    click_button 'Login'
    expect(page).to have_content('Invalid user!')
  end

  scenario 'login with a valid user' do
    user1 = User.create(username: 'Tadeu', full_name: 'Tadeu Sarro')
    visit new_session_path
    fill_in 'user_username', with: user1.username
    click_button 'Login'
    expect(page).to have_content('Logged in!')
  end

  scenario 'try and fail to create a new user, no username' do
    visit new_user_path
    fill_in 'user_username', with: ''
    fill_in 'user_full_name', with: 'Maria Sarro'
    click_button 'Register'
    expect(page).to have_content('Something went wrong, please try again!')
  end

  scenario 'try and fail to create a new user, no full_name' do
    visit new_user_path
    fill_in 'user_username', with: 'Maria'
    fill_in 'user_full_name', with: ''
    click_button 'Register'
    expect(page).to have_content('Something went wrong, please try again!')
  end

  scenario 'try and fail to create a new user, repeated information' do
    user1 = User.create(username: 'Tadeu', full_name: 'Tadeu Sarro')
    visit new_user_path
    fill_in 'user_username', with: user1.username
    fill_in 'user_full_name', with: user1.full_name
    click_button 'Register'
    expect(page).to have_content('Something went wrong, please try again!')
  end

  scenario 'create a new user' do
    visit new_user_path
    fill_in 'user_username', with: 'Maria'
    fill_in 'user_full_name', with: 'Maria Sarro'
    click_button 'Register'
    expect(page).to have_content('Account created successfully, welcome!')
  end
end
