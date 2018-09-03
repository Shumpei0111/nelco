class ToppagesController < ApplicationController
  
  def index
    if logged_in?
      @user = User.find_by(id: params[:id])
      @nelcopost = current_user.nelcopost.build
      user_ids = current_user.followings.pluck(:id) + [current_user.id]
      @followings_users_posts = Nelcopost.where(user_id: user_ids).order("created_at DESC").page(params[:page])
      debugger
      @nelcopost_pages = current_user.nelcopost.order("created_at DESC").page(params[:page])
      @ranking_counts = Favorite.ranking
      @nelcoposts = Nelcopost.find(@ranking_counts.keys)
    end
  end

  
end
