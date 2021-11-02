class Company < ApplicationRecord

  validates_presence_of :company_name, :state_registration
  validates_length_of :company_name, minimum: 3
  validate :validate_cnpj
  has_many :addresses

  def validate_cnpj
    unless CNPJ.valid?(cnpj)
      errors.add(:cnpj, :invalid)
    end
  end

  def fantasy_name
    super.blank? ? company_name : super
  end
end
