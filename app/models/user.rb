class User < ApplicationRecord
    has_many :crafts, dependent: :destroy
    has_many :thanks, dependent: :destroy
    
    mount_uploader :avatar, AvatarUploader
    
    validates :name, length: { in: 1..100 }
    validates :profile_text, length: { in: 1..1000 },on: :edit,allow_blank: true
    
    before_save { self.mail = mail.downcase }
    VALID_MAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :mail, presence: true, length: { maximum: 255 },
                    format: { with: VALID_MAIL_REGEX, message: "を正しく入力してください" },
                    uniqueness: { case_sensitive: false }
                    
    VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]+\z/
    validates :password, length: { in: 6..72 },
            format: { with: VALID_PASSWORD_REGEX, message: "は半角6文字以上/英大文字・小文字・数字をそれぞれ１文字以上含めてください"},
                confirmation: { type: :password },on: :create
    validates :password, length: { in: 6..72 },
            format: { with: VALID_PASSWORD_REGEX, message: "は半角6文字以上/英大文字・小文字・数字をそれぞれ１文字以上含めてください"},
                confirmation: { type: :password },on: :update,allow_blank: true
    has_secure_password
    validates :agree, acceptance: true, on: :create
    
end
