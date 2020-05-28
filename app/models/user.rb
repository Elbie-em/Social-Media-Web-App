class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friend_requests, foreign_key: :requester_id, dependent: :destroy
  has_many :requestees, through: :friend_requests
  has_many :received_requests, class_name: 'FriendRequest', foreign_key: :requestee_id, dependent: :destroy
  has_many :friendships, foreign_key: :requestee_id, dependent: :destroy
  has_many :friends, through: :friendships, foreign_key: :requester_id, source: 'requestee'
  has_many :accepted_requests, class_name: 'Friendship', foreign_key: :requester_id, dependent: :destroy

  def sent_request(current_user, user)
    current_user.friend_requests.find_by(requester: current_user.id, requestee: user.id)
  end

  def received_request(current_user, user)
    current_user.received_requests.find_by(requester: user.id, requestee: current_user.id)
  end

  def friendship(current_user, user)
    current_user.friendships.find_by(requestee: current_user.id, requester: user.id)
  end

  def accepted_friendship(current_user, user)
    current_user.accepted_requests.find_by(requestee: user.id, requester: current_user.id)
  end
end
