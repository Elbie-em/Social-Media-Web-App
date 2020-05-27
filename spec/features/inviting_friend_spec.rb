require 'rails_helper'

RSpec.describe 'Inviting to Friendship', type: :feature do
    user_a = User.create!(name: 'example1', email: 'user1@example.com', password: 'password1')
    user_b = User.create!(name: 'example2', email: 'user2@example.com', password: 'password2')
    user_c = User.create!(name: 'example3', email: 'user3@example.com', password: 'password3')
    
    it 'is inviting a user to be friends' do
        visit new_user_session_path
        fill_in 'Email', with: 'user1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'Log in'
        visit posts_path
        visit user_path(user_b)
        click_on 'Send Friend Request'
        visit user_path(user_b)
        expect(page).to have_content('Cancel Request')
    end
end