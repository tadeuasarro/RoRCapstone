require 'rails_helper'

RSpec.describe 'Following Features', type: :feature do
  scenario 'follow and unfollow the second user' do
    user1 = User.create(id: 1, username: 'Tadeu', full_name: 'Tadeu Sarro')
    user2 = User.create(id: 2, username: 'Maria', full_name: 'Maria Sarro')

    visit new_session_path
    fill_in 'user_username', with: user1.username
    click_button 'Login'

    visit user_path(id: user2.id)

    find('#follow-button').click
    expect(page).to have_content("You're following that person!")

    find('#follow-button').click
    expect(page).to have_content("You've stopped following that person!")
  end
end
