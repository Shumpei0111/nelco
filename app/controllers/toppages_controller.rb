class ToppagesController < ApplicationController
  def index
    if logged_in?
      @nelcopost = current_user.nelcopost.build
      user_ids = current_user.followings.pluck(:id) + [current_user.id]
      followings_users_posts = Nelcopost.where(user_ids).order("created_at DESC").page(params[:page])
      @nelcoposts = current_user.nelcopost.order("created_at DESC").page(params[:page])
    end
  end
end
