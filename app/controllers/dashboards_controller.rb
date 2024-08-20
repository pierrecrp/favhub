class DashboardsController < ApplicationController

  def index
    @favorites = current_user.favorites
    @lists = current_user.lists
  end
end
