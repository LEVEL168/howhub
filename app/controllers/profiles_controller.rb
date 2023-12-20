class ProfilesController < ApplicationController
    before_action :require_login
    
    def show
        @crafts = Craft.where(user_id: current_user.id).page(params[:page]).per(15)
    end
    
    def new
        thanks = Thank.where(user_id: current_user.id).pluck(:craft_id)
        @thanks = Craft.find(thanks)
        @thanks = Kaminari.paginate_array(@thanks).page(params[:page]).per(15)
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
