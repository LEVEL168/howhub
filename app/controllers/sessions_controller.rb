class SessionsController < ApplicationController
  before_action :require_login, only: [:show, :destroy]
  
  def login
    
  end
  
  def create
    user = User.find_by(mail: params[:mail].downcase)
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to root_path, notice: "ログインしました"
    else
      flash.now[:warning] = "メールアドレスかパスワードが間違っています"
      render "login"
    end
  end
  
  def destroy
    log_out
    redirect_to login_path
  end
end
