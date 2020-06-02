# rubocop:disable Layout/LineLength

class FriendshipsController < ApplicationController
  def new
    current_user.friendships.build
  end

  def create
    @user = User.find(params[:requester_id])
    @r_request = current_user.received_requests.find_by(requester: @user.id, requestee: current_user.id)
    @friendship = current_user.friendships.build(status: true, requester_id: params[:requester_id])
    @reversed = Friendship.new(status: true, requestee_id: params[:requester_id], requester_id: current_user.id)
    if @friendship.save
      @reversed.save
      @r_request.destroy
      redirect_to user_path(@user), notice: "You are now friends with #{@user.name}"
    else
      redirect_to user_path(@user), notice: 'Error accepting request'
    end
  end

  def destroy
    friendship = Friendship.find_by(params[:friendship_id])
    friendships = Friendship.where(requestee_id: friendship.requestee_id, requester_id: friendship.requester_id).or(Friendship.where(requestee_id: friendship.requester_id, requester_id: friendship.requestee_id))

    if !friendships.empty?
      Friendship.destroy(friendships.ids)

      redirect_to users_path, notice: 'You removed a friend!'
    else
      redirect_to users_path, alert: 'Error removing friend!'
    end
  end
end

# rubocop:enable Layout/LineLength
