class BankRepresenter
  def initialize(bank)
    @bank = bank
  end

  def as_json
    {
      id: bank.id,
      code: bank.code,
      description: bank.description
    }
  end

  private

  attr_reader :company
end
