class FriendshipsController < ApplicationController
    def create

    end

    def new

    end

    def destroy

    end

    private
    def friendship_params
        params.require(:friendship).permit(:content)
    end
end
