require 'rails_helper'

RSpec.describe Like, type: :model do
    let(:user) { User.create!(name: 'john doe', email: 'johndoe@example.com', password: 'azerty012') }
    let(:post) { user.posts.create!(content: 'I am the Pizza!') }
    let(:like) { Like.create!(post_id: post.id, user_id: user.id) }

    it 'is valid with valid attributes' do
        expect(like).to be_valid
    end

    it 'is not valid without a user id' do
        like.user_id = nil
        expect(like).to_not be_valid
    end

    it 'is not valid without a post id' do
        like.post_id = nil
        expect(like).to_not be_valid
    end
  
    describe 'Associations' do
        context 'Belonging to existent models' do
            it { should belong_to(:user) }
            it { should belong_to(:post) }
        end
    end
end