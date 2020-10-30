require 'rails_helper'

RSpec.describe 'Following Features', type: :feature do

  before :each do
    user1 = User.create(id: 1, username: 'Tadeu', full_name: 'Tadeu Sarro')
    user2 = User.create(id: 2, username: 'Maria', full_name: 'Maria Sarro')
  end

  scenario 'follow and unfollow the second user' do
    visit new_session_path
    fill_in 'user_username', with: 'Tadeu'
    click_button 'Login'

    visit user_path(id: 2)

    find('#follow-button').click
    expect(page).to have_content("You're following that person!")

    find('#follow-button').click
    expect(page).to have_content("You've stopped following that person!")
  end


end
