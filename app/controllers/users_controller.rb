class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :followings, :followers]
  
  def index
  end

  def show
      @user = User.find(params[:id])
      @nelcopost = current_user.nelcopost.build # form_for 用
      @nelcoposts = @user.nelcopost.order("created_at DESC").page(params[:page]).per(20)
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
  
  def edit
    #debugger
    @user = User.find_by(params[:user_id])
  end
  
  def update
    @user = User.find_by(params[:user_id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
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
  
  def favorites
    @user = User.find(params[:id])
    @favorites = @user.favs.order("created_at DESC").page(params[:page])
    counts(@user)
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon)
  end
end
