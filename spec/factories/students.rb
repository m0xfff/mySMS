FactoryBot.define do
  # factory :student do
  #   title "Mr"
  #   first_name "John"
  #   middle_name "Adam"
  #   last_name "Smith"
  #   email "tester@example.com"
  #   birth_date "1994-10-10"
  #   gender "male"
  #
  #   trait :over_18 do
  #     birth_date 18.years.ago
  #   end
  # end

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
