class Friendship < ApplicationRecord
  validates :status, presence: true
  validates :requestee, presence: true
  validates :request, presence: true

  belongs_to :requestee, class_name: 'User', foreign_key: :requestee_id
  belongs_to :request, class_name: 'FriendRequest', foreign_key: :request_id
end
