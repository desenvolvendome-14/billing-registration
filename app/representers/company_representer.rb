class CompanyRepresenter
  def initialize(company)
    @company = company
  end
  def as_json
    {
      id: company.id,
      company_name: company.company_name
    }
  end
  private
  attr_reader :company
end