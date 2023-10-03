class ProfilesController < ApplicationController
    def show
        
    end
    
    def edit
        
    end
    
    def update
       if @user.update(user_params) 
        #   このメッセージこのやり方じゃないとだめか？
           redirect_to profile_path, success: t("defaults.message.updated", item: User.model_name.human)
       else
           flah.now[:notice] = t("defaults.message.not_updated", item: User.model_name.human)
           render :edit
       end
    end
    
    
    private
    
    def set_user
       @user = User.find(current_user.id) 
    end
    
    def user_params
       params.require(:user).permit(:name, :mail, :avatar, :avatar_cache) 
    end
end
