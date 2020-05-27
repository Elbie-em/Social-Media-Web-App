require 'rails_helper'

RSpec.describe 'Invting to Friendship', type: :feature do
    before :each do
        User.create!(username: 'example1', email: 'user1@example.com', password: 'password1')
        User.create!(username: 'example2', email: 'user2@example.com', password: 'password2')
        User.create!(username: 'example3', email: 'user3@example.com', password: 'password3')
    end

    it 'is inviting a user to be friends' do
        
    end
end