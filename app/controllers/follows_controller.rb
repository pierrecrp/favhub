class FollowsController < ApplicationController
  before_action :set_followed, only: %i[create destroy]
  before_action :set_follower, only: %i[create destroy]
  before_action :set_follow, only: %i[destroy]
  before_action :set_user_page_infos, only: %i[create destroy]

  def create
    @follow = Follow.new(follower: @follower, followed: @followed)
    if @follow.save
      redirect_to user_path(@followed)
    else
      render "users/show", status: :unprocessable_entity
    end
  end

  def destroy
    if @follow.destroy
      redirect_to user_path(@followed)
    else
      render "users/show", status: :see_other
    end
  end

  private

  def set_follow
    @follow = Follow.find(params[:id])
  end

  def set_user_page_infos
    @user = @followed
    @lists = @user.public_lists
    @existing_follows = Follow.find_by(follower: current_user, followed: @user)
  end

  def set_followed
    @followed = User.find(params[:user_id])
  end

  def set_follower
    @follower = current_user
  end
end
