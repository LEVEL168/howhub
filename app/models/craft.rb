class Craft < ApplicationRecord
    belongs_to :user

    validates :title, length: { in: 1..50 }
    validates :caption, length: { in: 1..2000 }
    mount_uploader :image, ImageUploader
    
    # def thank?(user)
    #     crafts.where(user_id: user.id).exists?
    # end
end
