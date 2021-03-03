FactoryBot.define do
  factory :course do
    association :institute
    name { Faker::Educator.subject }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    number_of_semesters { Faker::Number.non_zero_digit }
    start_date { Faker::Date.between(from: '2021-02-01', to: '2021-03-31') }
    end_date { Faker::Date.between(from: '2021-10-15', to: '2021-11-25')}
    allocation { Faker::Number.between(from: 10, to: 80) }
  end
end
