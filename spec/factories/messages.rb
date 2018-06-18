FactoryBot.define do
  factory :message do
    subject { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    user
    records {[FactoryBot.create(:record)]}
  end
end
