class Contact < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true
  validates :cellphone, presence: true
  validates :email, presence: true

  validates :status, presence: true
  enum status: {commercial: 1, residential: 2}
end
