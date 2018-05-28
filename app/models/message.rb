class Message < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :records
    validates :subject, presence: true
    validates :body, presence: true
end
