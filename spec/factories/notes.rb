FactoryBot.define do
  factory :note do
    title { Faker::Marketing.buzzwords }
    content { Faker::Lorem.paragraph_by_chars(number: 256) }

    factory :student_note do
      association :noteable, factory: :student
    end

    factory :course_note do
      association :noteable, factory: :course
    end

    factory :institute_note do
      association :noteable, factory: :institute
    end
  end
end
