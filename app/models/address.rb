class Address < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :participant, optional: true

  validates :zip_code, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :district, presence: true
  validates :street, presence: true
  validates :house_number, presence: true
end
