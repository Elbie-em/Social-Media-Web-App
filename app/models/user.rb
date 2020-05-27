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
  has_many :requestees, through: :requests
  has_many :received_requests, class_name: 'FriendRequest', foreign_key: :requestee_id, dependent: :destroy
  has_many :friendships, foreign_key: :requestee_id, dependent: :destroy
  has_many :requesters, through: :friendships
  has_many :accepted_requests, class_name: 'Friendship', foreign_key: :requester_id, dependent: :destroy
end
