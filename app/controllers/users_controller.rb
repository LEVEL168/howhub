class UsersController < ApplicationController
    before_action :require_login, only: [:show]
    
    def signup
        @user = User.new
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "#{@user.name}さん、HouHubへようこそ！" 
            redirect_to controller: :crafts, action: :look
        else
            render "signup"
        end
    end
    
    def show
       @user = User.find(params[:id])  
    end
    
    def destroy
        log_out
        redirect_to controller: :crafts, action: :top
    end
    
    def user_params
        # モデルに保存されるパラメータを許可されたもの以外は処理しないようにする設定
        params.permit(:name, :mail, :password, :password_confirmation, :agree)
    end
    
end
