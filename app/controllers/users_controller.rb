class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.page(params[:page])
    @nelcopost = current_user.nelcopost.build
    @nelcoposts = current_user.nelcopost.order("created_at DESC").page(params[:page])
  end

  def show
    if logged_in?
      @user = current_user
      @nelcopost = current_user.nelcopost.build # form_for 用
      @nelcoposts = current_user.nelcopost.order("created_at DESC").page(params[:page])
    end  
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
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
