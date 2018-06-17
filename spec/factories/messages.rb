FactoryBot.define do
  factory :message do
    subject Faker::Lorem.sentence
    body Faker::Lorem.paragraph
  end
end
