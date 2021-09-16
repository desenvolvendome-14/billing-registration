class Address < ApplicationRecord
  belongs_to :client
  belongs_to :carrier
  belongs_to :seller
  belongs_to :supplier
  belongs_to :company

  validates :zip_code, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :district, presence: true
  validates :street, presence: true
  validates :house_number, presence: true
end
