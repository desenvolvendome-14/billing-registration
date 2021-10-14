# frozen_string_literal: true

class BankAccount < ApplicationRecord
  validates :description, :city, :agency, :account, :assignor, presence: true
end
