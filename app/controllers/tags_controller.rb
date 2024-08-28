class TagsController < ApplicationController
  protect_from_forgery with: :null_session


  def create
    @tag = Tag.new(tag_params)
    @tag.user = current_user
    if @tag.save
      redirect_back fallback_location: request.referer
    else
      render "favorites/show", status: :unprocessable_entity
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :color)
  end
  
end
