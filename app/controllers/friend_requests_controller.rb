# rubocop:disable Layout/LineLength
# rubocop:disable Style/GuardClause

class FriendRequestsController < ApplicationController
  def new
    @friend_request = current_user.friend_requests.new
  end

  def create
    @friend_request = current_user.friend_requests.build(requestee_id: params[:requestee_id])
    @user = User.find(params[:requestee_id])
    if @friend_request.save
      redirect_to user_path(@user), notice: 'Request Sent'
    else
      redirect_to user_path(@user), notice: 'Error sending request'
    end
  end

  def destroy
    friend_request = FriendRequest.find_by(params[:friend_request_id])
    if friend_request
      friend_request.destroy
      redirect_to users_path, notice: 'You canceled the request!'
    end
  end
end

# rubocop:enable Layout/LineLength
# rubocop:enable Style/GuardClause
