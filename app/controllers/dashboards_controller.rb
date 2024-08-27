class DashboardsController < ApplicationController

  def index
    @user = current_user
    @favorites = current_user.favorites
    @lists = current_user.lists.includes(:favorites)
    # Récupérer les derniers favoris créés par les users qui sont des followers du current_user
    following_ids = current_user.followeds_list
    # Les ordonner par date de création de manière décroissante
    @following_favorites = Favorite.where(user_id: following_ids).order(created_at: :desc)
  end
end
