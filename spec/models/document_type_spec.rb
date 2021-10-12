# frozen_string_literal: true

require "rails_helper"

RSpec.describe DocumentType, type: :model do
  it "create document type with factory default values" do
    document_type = build(:document_type)
    expect(document_type.description).to eq "Dinheiro"
  end
  it "create document type with factory other values" do
    document_type = build(:document_type, description: "cheque")
    expect(document_type.description).to eq "cheque"
  end
end
