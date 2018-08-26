class ToppagesController < ApplicationController
  def index
    if logged_in?
      @nelcopost = current_user.nelcopost.build
      @nelcoposts = current_user.nelcopost.order("created_at DESC").page(params[:page])
    end
  end
end
