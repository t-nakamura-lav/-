FactoryBot.define do
  factory :tweet do
    challenge { Faker::Lorem.characters(number:10) }
    tweet { Faker::Lorem.characters(number:30) }
    association :user
  end
end