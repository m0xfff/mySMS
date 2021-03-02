FactoryBot.define do
  factory :institute do
    sequence(:name) { |n| Faker::Educator.university + "-#{n}" }
  end
end
