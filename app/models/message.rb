class Message < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :records
    validate :minimum_one_record
    validates :subject, presence: true
    validates :body, presence: true

    private

    def minimum_one_record
        errors.add(:records, "Please select at least one record") if records.length.zero?
    end
end
