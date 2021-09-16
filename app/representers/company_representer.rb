class CompanyRepresenter
  def initialize(company)
    @company = company
  end
  def as_json
    {
      id: company.id,
      company_name: company.company_name,
      cnpj: company.cnpj,
      state_registration: company.state_registration,
      fantasy_name: company.fantasy_name,
      business_phone: company.business_phone
    }
  end
  private
  attr_reader :company
end