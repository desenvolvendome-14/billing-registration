FactoryBot.define do
  factory :address do
    zip_code { "MyString" }
    state { "MyString" }
    city { "MyString" }
    district { "MyString" }
    street { "MyString" }
    house_number { "MyString" }
    client { nil }
    carrier { nil }
    seller { nil }
    supplier { nil }
    company { nil }
  end
end
