class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user)
    logger.debug "LOOK AT ME IM DEBUGGING, (LIKE A VIP) now at AllUsers: #{params[:user_id]}" 
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end
end
