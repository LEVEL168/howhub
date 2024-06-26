class ProfilesController < ApplicationController
    before_action :require_login
    before_action :correct_user,   only: [:new, :edit, :update]
    
    def show
        @user = User.find(current_user.id)
        @crafts = Craft.where(user_id: current_user.id).page(params[:page]).per(18)
    end
    
    def new
        if correct_user
            thanks = Thank.where(user_id: current_user.id).pluck(:craft_id)
            @thanks = Craft.eager_load(:user).find(thanks)
            @thanks = Kaminari.paginate_array(@thanks).page(params[:page]).per(18)
        else
            redirect_to(root_path) unless current_user?(@user)
        end
    end
    
    def edit
        
    end
    
    def update
       if correct_user
           @user = User.find(current_user.id)
           if @user.update(profile_params)
               flash[:notice] = "プロフィールを更新しました"
               redirect_to profile_path
           else
               flash.now[:alert] = "※がついている項目を入力してください"
               render :edit
           end
       else
           redirect_to(root_path) unless current_user?(@user)
       end
    end
    
    
    def profile_params
       params.require(:user).permit(:name, :maill, :avatar, :avatar_cache, :profile_text).merge(id: current_user.id)
    end
    
    private
    
        def correct_user
          @user = User.find_by(params[:id])
        end
end
