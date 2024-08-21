class FavoritesController < ApplicationController

  before_action :set_favorite, only: %i[show update]

  def index
    @favorites = Favorite.where(user: current_user)
    @lists = List.where(user: current_user)

    if params[:list_id].present?
      @favorites = @favorites.where(list_id: params[:list_id])
    else
      @favorites = @favorites.where(list_id: nil)
    end

  end

  def show
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to favorites_path
    else
      render "favorites", status: :unprocessable_entity
    end
  end

  def update
    @favorite.update(list_id: params[:list_id])
  end

  private

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :public)
  end
end
