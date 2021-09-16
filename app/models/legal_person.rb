class LegalPerson < ApplicationRecord
  validates :corporate_name, presence: true
  validates :fantasy_name, presence: true
  validates :state_registration, presence: true
  validates :municipal_registration, presence: true
  validates :cell_phone, presence: true
end
