class ToppagesController < ApplicationController
  
  def index

  
      @user = User.find_by(id: session[:user_id])
      @usertask = User.find_by(id: session[:user_id]).usertasks.build  # form_for 用
      @usertasks = User.find_by(id: session[:user_id]).usertasks.order('created_at DESC').page(params[:page])
    
  end

  
  
  def new
    session[:user_id] = nil
  end

  def create
        email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end

  def destroy
    redirect_to root_path
  end
  
  
    private

  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
