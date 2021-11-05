require 'rails_helper'

RSpec.describe Address, type: :model do
  it { is_expected.to validate_presence_of(:zip_code) }
  it { is_expected.to validate_presence_of(:state) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:district) }
  it { is_expected.to validate_presence_of(:street) }
  it { is_expected.to validate_presence_of(:house_number) }

  it "create charts account with factory default values" do
    address = build(:address)
    expect(address.zip_code).to eq("16260000")
    expect(address.state).to eq("SP")
    expect(address.city).to eq("Coroados")
    expect(address.district).to eq("Gentil Bernardes")
    expect(address.street).to eq("Rua Maestro Antônio Guerra")
    expect(address.house_number).to eq("39")
    expect(address.complement).to eq("casa")
    expect(address.participant_id).to eq(1)
  end
end
