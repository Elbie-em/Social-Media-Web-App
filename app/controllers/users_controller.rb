class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @sent_request = current_user.sent_request(current_user, @user)
    @received_request = current_user.received_request(current_user, @user)
    @friendship = current_user.friendship(current_user, @user)
    @accepted_friendship = current_user.accepted_friendship(current_user, @user)
  end
end
