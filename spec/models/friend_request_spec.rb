require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  context 'Checking for Validations on FriendRequest Model' do
    let(:requester) { User.create!(name: 'john doe', email: 'johndoe@example.com', password: 'azerty012') }
    let(:requestee) { User.create!(name: 'jane doe', email: 'janedoe@example.com', password: 'azerty012') }
    let(:subject) { FriendRequest.create!(requester_id: requester.id, requestee_id: requestee.id) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a requester_id' do
      subject.requester_id = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a requestee_id' do
      subject.requestee_id = nil
      expect(subject).to_not be_valid
    end
  end
end