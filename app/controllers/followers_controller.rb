class FollowersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_followed, only: %i[create destroy]

  def create
    @follow = Follow.new(follower_id: @follower, followed_id: @followed) 
  end

  def destroy
    
  end

  private

  def set_followed
    @followed = User.find(params[:user_id])
  end

  def set_follower
    @follower = current_user
  end
end
