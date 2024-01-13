class Contact < ApplicationRecord
    validates :name, presence: true, length: { in: 1..20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 50 },
                      format: { with: VALID_EMAIL_REGEX, message: "を正しく入力してください" }
                      
    validates :subject, presence: true, length: { in: 1..200 }
    validates :message, presence: true, length: { in: 1..2000 }
end
