require 'rails_helper'

RSpec.describe 'User Features', type: :feature do
  scenario 'Fail to update an photo' do
    user1 = User.create(id: 1, username: 'Tadeu', full_name: 'Tadeu Sarro')
    visit new_session_path
    fill_in 'user_username', with: user1.username
    click_button 'Login'

    visit edit_user_path(id: 1)

    click_button 'Upload photo'
    expect(page).to have_content('Please, select a valid file!')
  end

  scenario 'Fail to update an image' do
    user1 = User.create(id: 1, username: 'Tadeu', full_name: 'Tadeu Sarro')
    visit new_session_path
    fill_in 'user_username', with: user1.username
    click_button 'Login'

    visit edit_user_path(id: 1)

    click_button 'Upload image'
    expect(page).to have_content('Please, select a valid file!')
  end
end
