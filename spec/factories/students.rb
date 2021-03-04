FactoryBot.define do
  factory :student do
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    birth_date { Faker::Date.birthday }
    gender { Faker::Gender.type }
    association :title

    # This breaks the test, but is good for generating hundreds of students in one go.
    # title do
    #   name = Faker::Name.prefix
    #   Title.where(name: name).first || create(:title, name: name)
    # end
  end
end
