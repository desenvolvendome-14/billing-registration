class Participant < ApplicationRecord
  validates :name, presence: true
  validates :cpf_cpnj, presence: true
  validates :fantasy_name, presence: true
  validates :type, presence: true
  validates :client_type, presence: true

  enum type: {legal_person: 1, physical_person: 2, foreign:3}
  enum client_type: {customer: 1, supplier: 2, seller:3, carrier:4}

end
