FactoryBot.define do
  factory :note do
    title { Faker::Marketing.buzzwords }
    content { Faker::Lorem.paragraph_by_chars(number: 256) }

    trait :on_student do
      association :entity, factory: :student
    end

    trait :on_course do
      association :entity, factory: :course
    end

    trait :on_institute do
      association :entity, factory: :institute
    end
  end
end
