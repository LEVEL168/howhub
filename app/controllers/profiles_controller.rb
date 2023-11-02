class ProfilesController < ApplicationController
    before_action :require_login
    
    def show
        # crafts = Craft.includes(:user)
        # crafts = Craft.find(current_user.id)
        @user = User.find(current_user.id)
        # @crafts = Craft.find(current_user.id)
        @crafts = Craft.page(params[:page]).per(10)
        # @crafts = @user.crafts.page(params[:page]).per(10).order('updated_at DESC')
    end
    
    def edit
        
    end
    
    def update
       @user = User.find(current_user.id)
       if @user.update(profile_params)
           flash[:notice] = "プロフィールを更新しました"
           redirect_to profile_path
       else
           flash.now[:alert] = "※がついている項目を入力してください"
           render :edit
       end
    end
    
    
    def profile_params
       params.require(:user).permit(:name, :maill, :avatar, :avatar_cache, :profile_text).merge(id: current_user.id)
    end
end
