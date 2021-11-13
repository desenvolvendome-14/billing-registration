FactoryBot.define do
  factory :address do
    zip_code { "16260000"}
    state { "SP" }
    city { "Coroados"}
    district { "Gentil Bernardes" }
    street { "Rua Maestro Antônio Guerra" }
    house_number { "39" }
    complement { "casa"}
    participant { create(:participant) }
  end
end
