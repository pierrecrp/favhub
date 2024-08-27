class FavoriteTagsController < ApplicationController

  def create
    @favorite = Favorite.find(params[:favorite_id])
    params[:favorite_tag][:tag].compact_blank.each do |tag_id|
      @favorite_tag = FavoriteTag.new(tag_id: tag_id, favorite: @favorite)
      @favorite_tag.save
    end
    redirect_to favorite_path(@favorite)
  end

  private

  def favorite_tag_params
    params.require(:favorite_tag).permit(tag_ids: [])
  end
end
