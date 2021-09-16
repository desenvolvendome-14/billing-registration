FactoryBot.define do
  factory :company do
    cnpj { Faker::CNPJ.pretty }
    state_registration { Faker::Number.number(digits: 10) }
    company_name { Faker::Company.name }
    fantasy_name { Faker::Company.name }
    business_phone { Faker::Number.number(digits: 10) }
  end
end