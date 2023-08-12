class UsersController < ApplicationController
    def signup
        
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "#{@user.name}さん、HouHubへようこそ！" 
            redirect_to root_path
        else
            flash.now[:alert] = "*がついている項目を全て入力してください"
            render "signup"
        end
    end
    
    def login
        render "/crafts/login"
    end
    
    def user_params
        # モデルに保存されるパラメータを許可されたもの以外は処理しないようにする設定
        params.permit(:name, :mail, :password, :password_confirmation, :agree)
    end
    
end
