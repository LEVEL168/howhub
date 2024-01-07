class Contact < ApplicationRecord
    attr_accessor :name, :email, :subject, :message
   
    validates :name, presence: true, length: { in: 1..20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 30 },
                      format: { with: VALID_EMAIL_REGEX }
    validates :subject, presence: true, length: { in: 1..200 }
    validates :message, presence: true, length: { in: 1..2000 }
end