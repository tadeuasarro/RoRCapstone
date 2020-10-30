require 'rails_helper'

RSpec.describe 'User Features', type: :feature do

  before :each do
    user1 = User.create(id: 1, username: 'Tadeu', full_name: 'Tadeu Sarro')
  end

  scenario 'Fail to update an photo' do
    visit new_session_path
    fill_in 'user_username', with: 'Tadeu'
    click_button 'Login'

    visit edit_user_path(id: 1)

    click_button 'Upload photo'
    expect(page).to have_content('Please, select a valid file!')
  end

  scenario 'Fail to update an image' do
    visit new_session_path
    fill_in 'user_username', with: 'Tadeu'
    click_button 'Login'

    visit edit_user_path(id: 1)

    click_button 'Upload image'
    expect(page).to have_content('Please, select a valid file!')
  end
end
