class Bank < ApplicationRecord
  has_many :bank_accounts

  validates :code, presence: true
  validates :description, presence: true
end
