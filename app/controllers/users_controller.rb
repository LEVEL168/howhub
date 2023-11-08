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
        @user = User.find(params[:user_id])
        @user.destroy
        flash[:notie] = "退会しました"
        redirect_to root_path
        # log_out
        # redirect_to controller: :crafts, action: :top
    end
    
    def user_params
        params.permit(:name, :mail, :password, :password_confirmation, :agree, :user_image)
    end
    
end
