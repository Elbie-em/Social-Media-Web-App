class FriendRequestsController < ApplicationController
    def new
        @friend_request = current_user.friend_requests.build
    end
    
    def create
        @friend_request = current_user.requests.build(requester_id: params[requester_id], requestee_id: params[requestee_id])
        @user = User.find(params[:requestee_id])
        if @friend_request.save
            redirect_to user_path(@user), notice: 'Request Sent'
        else
            redirect_to user_path(@user), notice: 'Error sending request'
        end
    end

    def destroy
        @friend_request.destroy
        redirect_to current_user, notice: 'You rejected the friend request'
    end


end
