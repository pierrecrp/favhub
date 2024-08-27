class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @lists = @user.public_lists
    @existing_follow = Follow.find_by(follower: current_user, followed: @user)
  end
end
