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
            log_in(@user)
            redirect_to controller: :crafts, action: :look
        else
            render "signup"
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def show
       @user = User.find(params[:id])
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:notice] = "退会しました"
        redirect_to root_path
    end
    
    def profile
        @user = User.find(params[:id])
        @crafts = Craft.where(user_id: @user).page(params[:page]).per(15)
    end
    
    def user_params
        params.permit(:name, :mail, :password, :password_confirmation, :agree, :user_image)
    end
    
end
