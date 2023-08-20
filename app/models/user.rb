class User < ApplicationRecord
    validates :name, length: { in: 1..50 }
    
    validates :mail, {uniqueness: true}
    before_save { self.mail = mail.downcase }
    VALID_MAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :mail, presence: true, length: { maximum: 255 },
                    format: { with: VALID_MAIL_REGEX, message: "を正しく入力してください" },
                    uniqueness: { case_sensitive: false }
                    
    VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{6,12}+\z/
    validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX, message: "は半角6~12文字/英大文字・小文字・数字をそれぞれ１文字以上含めてください"},
                confirmation: { type: :password }
    has_secure_password
    validates :agree, acceptance: true, on: :create
    
end
