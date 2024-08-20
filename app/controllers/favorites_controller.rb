class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[show]

  def index
    @favorites = Favorite.all
  end

  def show

  end

  def update
    @list = List.new
    @favorite.update(list_id: params[:list_id])
  end

  private

  def set_favorite
    @favorite = Favorite.find(params[:favorite_id])
  end
end
