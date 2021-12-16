FactoryBot.define do
  factory :bank_account do
    description { "conta corrente" }
    city { "Coroados-SP" }
    agency { "0001" }
    agency_digit { "1" }
    account { "9999" }
    account_digit { "9" }
    assignor { "77777" }
  end
end
