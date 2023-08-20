class ThanksController < ApplicationController
    def create
        @craft_thanks = Thank.new(user_id: current_user.id, craft_id: params[:craft_id])
        @craft_thanks.save
        redirect_to craft_path(params[:post_id])
    end
    
    def create
        @craft_thanks = Thank.find_by(user_id: current_user.id, create_id: params[craft_id])
        @craft_thanks.destroy
        redirect_to craft_path(params[:craft_id])
    end
end
