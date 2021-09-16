FactoryBot.define do
  factory :bank do
    code { Faker::Bank.name }
    description  { Faker::Bank.description }
  end
end