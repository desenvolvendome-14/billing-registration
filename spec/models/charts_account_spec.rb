# frozen_string_literal: true

require "rails_helper"

RSpec.describe ChartsAccount, type: :model do
  it "create charts account with factory" do
    chart_account = build(:charts_account)

    expect(chart_account.description).to eq "Matéria-Prima"
    expect(chart_account.internal_code.to_i).to eq 99
  end
  it "create charts account without factory" do
    chart_account = build(:charts_account, description: "Plano de contas genérico", internal_code: 1000)
    expect(chart_account.description).to eq "Plano de contas genérico"
    expect(chart_account.internal_code.to_i).to eq 1000
  end
end
