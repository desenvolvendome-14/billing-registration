class Participant < ApplicationRecord

  validates :name, length: { minimum: 3 }, presence: true
  validates :cpf_cnpj, presence: true
  validates :person_type, presence: true
  validates :client_type, presence: true
  validate :validate_cpf_cnpj

  enum person_type: {legal_person: 1, physical_person: 2, foreign:3}
  enum client_type: {customer: 1, supplier: 2, seller:3, carrier:4}
  has_many :contacts
  has_many :addresses

  accepts_nested_attributes_for :addresses

  before_save :fantasy_name_nil?
  before_validation :retrieve_address

  def fantasy_name_nil?
    self.fantasy_name = name
  end

  def validate_cpf_cnpj
    unless CPF.valid?(cpf_cnpj) || CNPJ.valid?(cpf_cnpj)
      errors.add(:cpf_cnpj, :invalid)
    end
  end

  def retrieve_address
    return if addresses.empty?

    addresses.each do |address|
      response = HTTParty.get('https://viacep.com.br/ws/'"#{address.zip_code}"'/json/')
      address.state = response.parsed_response["uf"] if address.state.nil?
      address.city = response.parsed_response["localidade"] if address.city.nil?
      address.district = response.parsed_response["bairro"] if address.district.nil?
      address.street = response.parsed_response["logradouro"] if address.street.nil?
      address.complement = response.parsed_response["complemento"] if address.complement.nil?
    end
  end

end
