class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { minimum: 2, maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    has_many :owned_records, :class_name => 'Record', :foreign_key => 'owner_id'
    has_and_belongs_to_many :accessible_records, :class_name => 'Record'
end
