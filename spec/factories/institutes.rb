FactoryBot.define do
  factory :institute do
    name { Faker::Educator.university }
  end
end
