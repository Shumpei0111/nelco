class NelcopostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @nelcopost = current_user.nelcopost.build(nelcopost_params)
    if @nelcopost.save
      flash[:success] = "投稿しました"
      redirect_to user_path(:id)
    else
      flash.now[:danger] = "投稿できませんでした"
      render "users/show"
    end
  end

  def destroy
    @nelcopost.destroy
    flash[:success] = "削除しました"
    redirect_back(fallback_location: user_path)
  end
  
  private
  
  def nelcopost_params
    params.require(:nelcopost).permit(:title, :image)
  end
  
  def correct_user
    @nelcopost = current_user.nelcopost.find_by(id: params[:id])
    unless @nelcopost
      redirect_to users_path
    end
  end
  
end
