class DashboardsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @favorites = current_user.favorites
    @lists = current_user.lists
  end
end
