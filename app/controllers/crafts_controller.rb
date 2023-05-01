class CraftsController < ApplicationController
    def look
        #投稿一覧ページ（ログイン時トップページ）が呼ばれたときに動作するアクション
        @crafts = Craft.all
    end
    
    def new
        #投稿作成ページが呼ばれたときに動作するアクション
        
    end
    
    def create
        #新しい投稿がフォームからPostされたときに動作するアクション
        Craft.create(title:params["crafts"]["title"],caption:params["crafts"]["caption"])
        redirect_to "/"
    end
    
    def destroy
       craft = Craft.find(params["id"])
       craft.destroy
       redirect_to "/"
    end
    
    def user_params
        # モデルに保存されるパラメータを許可されたもの以外は処理しないようにする設定
        params.require(:user).permit(:name, :email, :password, :image)
    end
    
end
