require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(name: 'john doe', email: 'johndoe@example.com', password: 'azerty012') }
  let(:post) { user.posts.create!(content: 'I am the Pizza!') }
  let(:comment) { Comment.create!(user_id: user.id, post_id: post.id, content: 'Pizza for President') }

  it 'is valid with valid attributes' do
    expect(comment).to be_valid
  end

  it 'is not valid without a user id' do
    comment.user_id = nil
    expect(comment).to_not be_valid
  end

  it 'is not valid without a post id' do
    comment.post_id = nil
    expect(comment).to_not be_valid
  end

  it 'is not valid without content' do
    comment.content = nil
    expect(comment).to_not be_valid
  end

  it 'is not valid with content larger than 200 characters' do
    comment.content = 'In the jungle' * 20
    expect(comment).to_not be_valid
  end

  describe 'Associations' do
    context 'Belonging to existent models' do
      it { should belong_to(:user) }
      it { should belong_to(:post) }
    end
  end
end
