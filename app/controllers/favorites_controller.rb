class FavoritesController < ApplicationController

  before_action :set_favorite, only: %i[show update destroy]
  before_action :set_tags, only: %i[index show]

  def index
    @favorites = Favorite.where(user: current_user)
    @lists = List.where(user: current_user)
    @list = List.new

    if params[:list_id].present?
      @selected_list = List.find(params[:list_id])
      @favorites = @favorites.where(list_id: params[:list_id])
    else
      @favorites = @favorites.where(list_id: nil)
    end

    if params.dig(:search, :query).present?
      @favorites = Favorite.search_favorites(params[:search][:query])
    end
  end

  def show
    # debugger
    @favorite = Favorite.find(params[:id])
    @favorite_tag = FavoriteTag.new
    @tag = Tag.new
    # debugger

    # respond_to do |format|
    #   format.html
    #   format.turbo_stream do
    #     render turbo_stream: turbo_stream.update("favorite_modal_frame", partial: "favorites/favorite_modal", locals: { favorite: @favorite })
    #   end
    # end
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
    if params[:add_list] == "true"
      @favorite.update(list_id: params[:list].to_i)
    else
      @favorite.update(list_id: nil)
    end
    redirect_to favorites_path
  end

  def destroy
    @favorite.destroy
    redirect_to dashboards_path, status: :see_other
  end


  private

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def set_tags
    @tags = Tag.where(user_id: :current_user_id)
  end

  def list_params
    params.require(:list).permit(:name, :public)
  end
end
