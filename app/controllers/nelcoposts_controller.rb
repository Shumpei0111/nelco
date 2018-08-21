class NelcopostsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @nelcopost = current_user.nelcopost.build(nelcopost_params)
    if @nelcopost.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      flash.now[:danger] = "投稿できませんでした"
      render "users/show"
    end
  end

  def destroy
  end
  
  private
  
  def nelcopost_params
    params.require(:nelcopost).permit(:title, :image)
  end
  
end
