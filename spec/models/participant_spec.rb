require 'rails_helper'

RSpec.describe Participant, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:cpf_cnpj) }

  it { is_expected.to validate_presence_of :person_type }
  it { is_expected.to define_enum_for(:person_type).with_values({ legal_person: 1, physical_person: 2, foreign: 3}) }

  it { is_expected.to validate_presence_of :client_type }
  it { is_expected.to define_enum_for(:client_type).with_values({ customer: 1, supplier: 2, seller: 3, carrier: 4}) }

  it { should validate_length_of(:name).is_at_least(3) }

  it { should have_many(:contacts) }
  it { should have_many(:addresses) }

  it "create participantes fantasy name null" do
    cnpj = CNPJ.generate
    participant = create(:participant, name: "Razão Social", fantasy_name: "", cpf_cnpj: cnpj,
                         person_type: 1,  client_type: 1, state_registration: "9" )

    expect(participant.name).to eq "Razão Social"
    expect(participant.fantasy_name).to eq "Razão Social"
    expect(participant.cpf_cnpj).to eq cnpj
    expect(participant.person_type).to eq "legal_person"
    expect(participant.client_type).to eq  "customer"
    expect(participant.state_registration).to eq "9"
  end
end

