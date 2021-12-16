FactoryBot.define do
  factory :bank do
    code { Faker::Number.number(digits: 3) }
    description { Faker::Bank.name }
  end
end
