FactoryBot.define do
  factory :title do
    name { Faker::Name.prefix }
  end
end
