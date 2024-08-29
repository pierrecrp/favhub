class ListsController < ApplicationController

  before_action :set_list, only: %i[show update]

  def index
    @lists = List.all
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
    @list.update(list_params)
    redirect_to favorites_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :public)
  end

  def set_list
    @list = List.find(params[:id])
  end
end

# redirect fall back
