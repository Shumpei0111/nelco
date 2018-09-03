class AllpostsController < ApplicationController
  def index
    @nelcoposts = Nelcopost.all.order("created_at DESC").page(params[:page]).per(50)
  end
end