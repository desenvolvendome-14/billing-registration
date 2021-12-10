# frozen_string_literal: true

require "rails_helper"

RSpec.describe BankAccount, type: :model do
  it "create bank account with factory default values" do
    bank_account = build(:bank_account)
    expect(bank_account.description).to eq "conta corrente"
    expect(bank_account.city).to eq "Coroados-SP"
    expect(bank_account.agency).to eq "0001"
    expect(bank_account.agency_digit).to eq "1"
    expect(bank_account.account).to eq "9999"
    expect(bank_account.account_digit).to eq "9"
    expect(bank_account.assignor).to eq "77777"
  end

  it "create bank account with factory other values" do
    bank_account = build(:bank_account, description: "poupança", city: "São Paulo-SP", agency: "0002",
                                        agency_digit: "2", account: "8888", account_digit: "8", assignor: "66666")
    expect(bank_account.description).to eq "poupança"
    expect(bank_account.city).to eq "São Paulo-SP"
    expect(bank_account.agency).to eq "0002"
    expect(bank_account.agency_digit).to eq "2"
    expect(bank_account.account).to eq "8888"
    expect(bank_account.account_digit).to eq "8"
    expect(bank_account.assignor).to eq "66666"
  end

  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:agency) }
  it { is_expected.to validate_presence_of(:account) }
  it { is_expected.to validate_presence_of(:assignor) }
end
