class CraftsController < ApplicationController
    before_action :require_login, except: [:top]
    
    def top
       #導入ページが呼ばれたときに動作するアクション
    end
    
    def look
        #投稿一覧ページ（ログイン時トップページ）が呼ばれたときに動作するアクション
        @users = User.all
        @crafts = Craft.all
        
    end
    
    def search
      @keywords = params[:keyword]
      @crafts = Craft.all
      split_keywords = @keywords.split(/[[:blank:]]+/)
      split_keywords.each do |word|
        @crafts = @crafts.where("title LIKE ? OR caption LIKE ?", "%#{word}%", "%#{word}%")
      end
    end
    
    def new
        #投稿作成ページが呼ばれたときに動作するアクション
        @user = User.find(params[:user_id])
        @craft = Craft.new
    end
    
    def create
        #新しい投稿がフォームからPostされたときに動作するアクション
        @craft = Craft.new(craft_params)
        if @craft.save!
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
        @craft_user = User.find(params[:user_id])
        @craft = Craft.find(params[:id])
    end
    
    def update
        @user = User.find(params[:user_id])
        @craft = Craft.find(params[:id])
        if @craft.update(craft_params)
            flash[:notice] = "投稿を更新しました"
            redirect_to root_path(@craft)
        else
            flash.now[:alert] = "※タイトルとキャプションを入力してください"
            render "edit"
        end
    end
    
    
    def show
       @craft = Craft.all
       @craft = Craft.find(params[:id]) 
    end
    
    
    def craft_params
        params.require(:craft).permit(:title, :caption, :image, :user_id)
    end
    
end
