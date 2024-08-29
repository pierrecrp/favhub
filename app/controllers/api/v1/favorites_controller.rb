class Api::V1::FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create]
  skip_before_action :authenticate_user!

  def create
    params[:favorites].each do |favorite|
      name = favorite[:title]
      source = favorite[:source]
      url = favorite[:url]
      @favorite = Favorite.find_or_initialize_by(name: name, source: source, url: url, user: current_user)
      @favorite.save
    end

    render json: { status: "created" }
  end
end
