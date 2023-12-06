class Craft < ApplicationRecord
    belongs_to :user
    has_many :thanks, dependent: :destroy

    validates :title, length: { in: 1..50 }
    validates :caption, length: { in: 1..2000 }
    mount_uploader :image, ImageUploader
    
    def thanked_by?(user)
        thanks.exists?(user_id: user.id)
    end
end
