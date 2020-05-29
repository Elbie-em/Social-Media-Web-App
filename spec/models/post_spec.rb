require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create!(name: 'john doe', email: 'johndoe@example.com', password: 'azerty012') }
  let(:post) { user.posts.create!(content: 'I am the Pizza!') }

  it 'is valid with valid attributes' do
    expect(post).to be_valid
  end

  it 'is not valid without content' do
    post.content = nil
    expect(post).to_not be_valid
  end

  it 'is not valid with content larger than 1000 characters' do
    post.content = 'In the jungle' * 100
    expect(post).to_not be_valid
  end

  describe 'Associations' do
    context 'Having many from the different existent models' do
      it { should have_many(:comments) }
      it { should have_many(:likes) }
    end

    context 'Belonging to existent models' do
      it { should belong_to(:user) }
    end
  end
end
