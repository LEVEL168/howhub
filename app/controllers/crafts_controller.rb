class CraftsController < ApplicationController
    before_action :require_login, except: [:top]
    
    def top
        
    end
    
    def look
        @users = User.all
        @craft_data = Craft.all.order(created_at: :desc)
        @crafts = Kaminari.paginate_array(@craft_data).page(params[:page]).per(15)
    end
    
    def search
      @keywords = params[:keyword]
      @crafts = Craft.all.order(created_at: :desc)
      split_keywords = @keywords.split(/[[:blank:]]+/)
      split_keywords.each do |word|
        @crafts = @crafts.where("title LIKE ? OR caption LIKE ?", "%#{word}%", "%#{word}%").page(params[:page]).per(15)
      end
    end
    
    def new
        @user = User.find(params[:user_id])
        @craft = Craft.new
    end
    
    def create
        @craft = Craft.new(craft_params)
        if @craft.save
            flash[:notice] = "投稿しました！" 
            redirect_to root_path
        else
            flash.now[:alert] = "※タイトルとキャプションを入力してください"
            render "new"
        end
    end
    
    def destroy
       @craft = Craft.find(params[:id])
       @craft.destroy
       flash[:notice] = "投稿を削除しました"
       redirect_to root_path
    end
    
    def edit
        @user = User.find(params[:user_id])
        @craft = Craft.find(params[:id])
        unless @craft.user_id == current_user.id
           redirect_to  user_craft_path
        end
    end
    
    def update
        @user = User.find(params[:user_id])
        @craft = Craft.find(params[:id])
        unless  @craft.user_id == current_user.id
           redirect_to  user_craft_path
        end
        if @craft.update(craft_params)
            flash[:notice] = "投稿を更新しました"
            redirect_to user_craft_path
        else
            flash.now[:alert] = "※タイトルとキャプションを入力してください"
            render "edit"
        end
    end
    
    
    def show
        @craft = Craft.find(params[:id])
        @user = @craft.user
        @crafts = @user.crafts
    end
    
    
    def craft_params
        params.require(:craft).permit(:title, :caption, :image, :user_id)
    end
    
end
