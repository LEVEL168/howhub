class Craft < ApplicationRecord
    validates :title, length: { in: 1..50 }
    validates :caption, length: { in: 1..2000 }
    mount_uploader :image, ImageUploader
end
