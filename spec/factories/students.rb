FactoryBot.define do
  factory :student do
    association :title
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    birth_date { Faker::Date.birthday }
    gender { Faker::Gender.type }
  end
end
