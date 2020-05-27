require 'rails_helper'


RSpec.describe Friendship, type: :model do
    context 'Checking for Validations on Friendship Model' do
      let(:requester) { User.create!(name: 'john doe', email: 'johndoe@example.com', password: 'azerty012') }
      let(:requestee) { User.create!(name: 'jane doe', email: 'janedoe@example.com', password: 'azerty012') }
      let(:subject) { Friendship.create!(status: true, requestee_id: requestee.id, requester_id: requester.id) }
  
      it 'is valid with valid attributes' do
        expect(subject).to be_valid
      end

      it 'is not valid without a status' do
        subject.status = nil
        expect(subject).to_not be_valid
      end
    
      it 'is not valid without a requestee_id' do
        subject.requestee_id = nil
        expect(subject).to_not be_valid
      end
  
      it 'is not valid without a requester_id' do
        subject.requester_id = nil
        expect(subject).to_not be_valid
      end
    end
  
    describe 'Associations' do
      context 'Belonging to user model' do
        it 'belongs to a requestee' do
          should belong_to(:requestee)
        end
        
        it 'belongs to a requester' do
          should belong_to(:requester)
        end
      end
    end 
  end