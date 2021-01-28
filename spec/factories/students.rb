FactoryBot.define do
  factory :student do
    title "Mr"
    first_name "John"
    middle_name "Adam"
    last_name "Smith"
    email "tester@example.com"
    birth_date "1994-10-10"
    gender "male"

    trait :unique_email do
      sequence(:email) { |n| "tester#{n}@example.com"}
    end

    trait :over_18 do
      birth_date 18.years.ago
    end
  end
end
