FactoryBot.define do
  factory :student do |f|
    f.title { Faker::Name.prefix}
    f.first_name { Faker::Name.first_name }
    f.middle_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.email { Faker::Internet.email }
    f.birth_date { Faker::Date.birthday }
    f.gender { Faker::Gender.type }
  end
end
