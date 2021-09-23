require 'rails_helper'

RSpec.describe Participant, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:cpf_cnpj) }
  it { is_expected.to validate_presence_of(:fantasy_name) }

  it { is_expected.to validate_presence_of :person_type }
  it { is_expected.to define_enum_for(:person_type).with_values({ legal_person: 1, physical_person: 2, foreign: 3}) }

  it { is_expected.to validate_presence_of :client_type }
  it { is_expected.to define_enum_for(:client_type).with_values({ customer: 1, supplier: 2, seller: 3, carrier: 4}) }

end
