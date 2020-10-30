require 'rails_helper'

RSpec.describe 'Post Features', type: :feature do

  before :each do
    user1 = User.create(username: 'Tadeu', full_name: 'Tadeu Sarro')
  end

  scenario 'try to visit posts index without login' do
    visit posts_path
    expect(page).to have_content('You must login first!')
  end

  scenario 'visit posts index and create a new post' do
    visit new_session_path
    fill_in 'user_username', with: 'Tadeu'
    click_button 'Login'

    fill_in 'post_text', with: 'This is some text.'
    click_button 'Submit post'
    expect(page).to have_content('Post created!')
  end

end
