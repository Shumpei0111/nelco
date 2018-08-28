class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  #お気に入り
  def create
    nelcopost = Nelcopost.find(params[:nelcopost_id])
    nelcopost.fav(current_user)
    redirect_back(fallback_location: root_url)
  end

  #お気に入り削除
  def destroy
    nelcopost = Nelcopost.find(params[:nelcopost_id])
    nelcopost.unfav(current_user)
    redirect_back(fallback_location: root_url)
  end
end