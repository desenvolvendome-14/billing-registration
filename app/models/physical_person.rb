class PhysicalPerson < ApplicationRecord
  validates :name, presence: true
  validates :last_name, presence: true
  validates :cell_phone, presence: true
end
