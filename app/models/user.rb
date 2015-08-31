class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: {maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
    validates :job, length: { maximum: 20 }
    validates :place, length: { maximum: 20 }
    validates :selfintroduction, length: { maximum: 140 }
    has_secure_password
    has_many :microposts
end
