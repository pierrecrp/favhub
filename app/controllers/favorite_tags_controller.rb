class FavoriteTagsController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :set_favorite_tag, only: %i[destroy]
  before_action :set_favorite, only: %i[create destroy]

  def create
    params[:favorite_tag][:tag].compact_blank.each do |tag_id|
      @favorite_tag = FavoriteTag.new(tag_id: tag_id, favorite: @favorite)
      @favorite_tag.save
    end
    redirect_to favorite_path(@favorite)
  end

  def destroy
    @favorite_tag.destroy
    redirect_to favorite_path(@favorite), status: :see_other
  end

  private

  def set_favorite_tag
    @favorite_tag = FavoriteTag.find(params[:id])
  end

  def set_favorite
    @favorite = Favorite.find(params[:favorite_id])
  end

  def favorite_tag_params
    params.require(:favorite_tag).permit(tag_ids: [])
  end
end
