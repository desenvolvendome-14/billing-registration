require "rails_helper"

RSpec.describe Address, type: :model do
  it { is_expected.to validate_presence_of(:zip_code) }
  it { is_expected.to validate_presence_of(:state) }
  it { is_expected.to validate_presence_of(:city) }

  it "create Address with factory default values" do
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

  it "create charts account with factory other values" do
    address = build(:address, zip_code: "16200203", state: "SP", city: "Birigui", district: "Vila Angélica",
                              street: "Avenida São Francisco", house_number: "156", complement: "predio", participant_id: "2")

    expect(address.zip_code).to eq("16200203")
    expect(address.state).to eq("SP")
    expect(address.city).to eq("Birigui")
    expect(address.district).to eq("Vila Angélica")
    expect(address.street).to eq("Avenida São Francisco")
    expect(address.house_number).to eq("156")
    expect(address.complement).to eq("predio")
    expect(address.participant_id).to eq(2)
  end
end
