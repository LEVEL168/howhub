class ProfilesController < ApplicationController
    before_action :require_login, only: %i[edit update]
    
    def show
        
    end
    
    def edit
        
    end
    
    def update
       @user = User.find(current_user.id)
       if @user.update!(profile_params)
           flash[:notice] = "プロフィールを更新しました"
           redirect_to profile_path
       else
           flash.now[:notice] = "※がついている項目を入力してください"
           render :edit
       end
    end
    
    
    private
    
    def set_user
       @user = User.find(current_user.id) 
    end
    
    def profile_params
       params.require(:user).permit(:name, :maill, :avatar, :avatar_cache, :profile_text) 
    end
end
