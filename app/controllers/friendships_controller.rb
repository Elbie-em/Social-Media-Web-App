# rubocop:disable Style/GuardClause

class FriendshipsController < ApplicationController
  def new
    current_user.friendships.build
  end

  def create
    @user = User.find(params[:requester_id])
    @r_request = current_user.received_requests.find_by(requester: @user.id, requestee: current_user.id)
    @friendship = current_user.friendships.build(status: true, requester_id: params[:requester_id])
    @reversed = Friendship.new(status: true,requestee_id: params[:requester_id],requester_id: current_user.id)
    if @friendship.save
      @reversed.save
      @r_request.destroy
      redirect_to user_path(@user), notice: "You are now friends with #{@user.name}"
    else
      redirect_to user_path(@user), notice: 'Error accepting request'
    end
  end

  def destroy
    friendships = Friendship.where(requestee_id: params[:requester_id],  requester_id: current_user.id).or(Friendship.where(requestee_id: current_user.id, requester_id: params[:requester_id]))
    logger.debug "LOOK AT ME IM DEBUGGING #{friendships.count}" 
    if !friendships.empty?
      friendships.each do |f|
        f.destroy
      end
      redirect_to users_path, notice: 'You removed a friend'
    end
  end
end

# rubocop:enable Style/GuardClause
