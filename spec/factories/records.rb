FactoryBot.define do
  factory :record do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    association :owner, factory: :user
  end
end
