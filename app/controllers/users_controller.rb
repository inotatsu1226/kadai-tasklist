class UsersController < ApplicationController
  def index
     @users = User.all.page(params[:page])
  end

  def show
     @user = User.find(params[:id])
     @current_user =  User.find_by(id: session[:user_id])
     
     @usertask=User.find(params[:id]).usertasks.build
     @usertasks=User.find(params[:id]).usertasks.order('created_at DESC').page(params[:page])

    if @user.id==@current_user.id then
      redirect_to usertask_url
      

    end
  end

  def new
    @user = User.new
  end
  
  

  def create
        @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
    private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
