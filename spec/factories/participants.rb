FactoryBot.define do
  factory :participant do
    name { Faker::Company.name }
    cpf_cnpj { Faker::Company.brazilian_company_number(formatted: true) }
    state_registration { Faker::Company.brazilian_company_number(formatted: false) }
    fantasy_name { Faker::Company.suffix }
    person_type { :legal_person }
    client_type { :customer }

    trait :with_address do
      addresses { build_list :address, 3 }
    end
  end
end
