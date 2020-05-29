# rubocop:disable Style/GlobalVars

require 'rails_helper'

RSpec.describe 'Accepting Friendship', type: :feature do
  before :each do
    $user_a = User.create!(name: 'example1', email: 'user1@example.com', password: 'password1')
    $user_b = User.create!(name: 'example2', email: 'user2@example.com', password: 'password2')
  end

  it 'is accepting a user to be friends' do
    visit new_user_session_path
    fill_in 'Email', with: 'user1@example.com'
    fill_in 'Password', with: 'password1'
    click_on 'Log in'
    visit posts_path
    visit user_path($user_b)
    click_on 'Send Friend Request'
    visit user_path($user_b)
    click_on 'Sign out'
    visit new_user_session_path
    fill_in 'Email', with: 'user2@example.com'
    fill_in 'Password', with: 'password2'
    click_on 'Log in'
    visit posts_path
    visit user_path($user_a)
    click_on 'Reject Request'
    visit user_path($user_a)
    expect(page).to have_content('Send Friend Request')
  end
end

# rubocop:enable Style/GlobalVars
