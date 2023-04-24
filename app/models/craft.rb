class Craft < ApplicationRecord
    mount_uploader :image, ImgUploader
end
