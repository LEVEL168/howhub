class ThanksController < ApplicationController
    before_action :require_login
    
    def create
       @craft = Craft.find(params[:user_id])
       thank = current_user.thanks.new(craft_id: @craft.id)
       thank.save
    end
    
    def destroy
        @craft = Craft.find(params[:user_id])
        thank = current_user.thanks.find_by(craft_id: @craft.id)
        thank.destroy
    end
end
