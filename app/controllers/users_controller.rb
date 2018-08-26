class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers]
  
  def index
    @users = User.page(params[:page])
    @nelcopost = current_user.nelcopost.build
    @nelcoposts = current_user.nelcopost.order("created_at DESC").page(params[:page])
  end

  def show
      @user = current_user
      @nelcopost = current_user.nelcopost.build # form_for 用
      @nelcoposts = current_user.nelcopost.order("created_at DESC").page(params[:page])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザー登録をしました"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザー登録できませんでした"
      render :new
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
