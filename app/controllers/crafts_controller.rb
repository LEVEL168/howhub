class CraftsController < ApplicationController
    def look
        #投稿一覧ページ（ログイン時トップページ）が呼ばれたときに動作するアクション
        
    end
    
    def new
        #東欧作成ページが呼ばれたときに動作するアクション
        
    end
    
    def create
        #新しい投稿がフォームからPostされたときに動作するアクション
        render plain: params["crafts"]["title"] + ":" + params["crafts"]["caption"]
    end
    
    def index
      #導入用トップページが呼ばれたときに動作するアクション 
        
    end
end
