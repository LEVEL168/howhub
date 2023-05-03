class Craft < ApplicationRecord
    mount_uploader :image, ImageUploader
    
# class SearchBugsForm
#   include ActiveModel::Model
  
#   attr_accessor :search_word
    
#   def search
#     relation = Bug.distinct

#     if search_word.present?
#       search_words = search_word.split(/[[:blank:]]+/)
#       search_words.inject(relation) do |result, word|
#         relation = result.where('title LIKE ?', "%#{word}%").or(result.where('caption LIKE ?', "%#{word}%"))
#       end
#     end
#   end
    
    
    def self.search(search) #self.でクラスメソッドとしている
        if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
          Craft.where(['title LIKE ? OR caption LIKE ?', "%#{search}%", "%#{search}%"])
        else
          Craft.all
        end
    end
end
# end
