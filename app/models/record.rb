class Record < ApplicationRecord
  belongs_to :owner, :class_name => 'User'
  has_and_belongs_to_many :users
  has_and_belongs_to_many :messages
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX }
end
