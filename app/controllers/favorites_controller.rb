class FavoritesController < ApplicationController

  before_action :set_favorite, only: %i[show update]

  def index
    @favorites = Favorite.where(user: current_user)
    @lists = List.where(user: current_user)
  end

  def show

  end

  def update
    @favorite.update(list_id: params[:list_id])
  end

  private

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end
end
