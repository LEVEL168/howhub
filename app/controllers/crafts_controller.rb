class CraftsController < ApplicationController
    def top
       #導入ページが呼ばれたときに動作するアクション
       
    end
    
    def look
        #投稿一覧ページ（ログイン時トップページ）が呼ばれたときに動作するアクション
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
        
    end
    
    def create
        #新しい投稿がフォームからPostされたときに動作するアクション
        Craft.create!(title:params["crafts"]["title"],caption:params["crafts"]["caption"],image:params["crafts"]["image"])
        redirect_to "/"
    end
    
    def destroy
       craft = Craft.find(params["id"])
       craft.destroy
       redirect_to "/"
    end
    
    def edit
        @craft = Craft.find(params["id"])
    end
    
    def update
        craft = Craft.find(params["id"])
        craft.title = params["crafts"]["title"]
        craft.caption = params["crafts"]["caption"]
        craft.save
        redirect_to "/"
    end
    
    def user_params
        # モデルに保存されるパラメータを許可されたもの以外は処理しないようにする設定
        params.require(:user).permit(:name, :email, :password, :image)
    end
    
end
