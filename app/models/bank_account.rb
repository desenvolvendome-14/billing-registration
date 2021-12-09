# frozen_string_literal: true

class BankAccount < ApplicationRecord
  belongs_to :bank

  validates :description, :city, :agency, :account, :assignor, presence: true
end
