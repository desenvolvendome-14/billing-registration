class BanksFetcher
  def initialize(params)
    @code = params[:code] || nil
    @description = params[:description] || nil
  end

  def fetch
    if build_find_hash.empty?
      Bank.all
    else
      Bank.where(build_find_hash)
    end
  end

  private

  def build_find_hash
    {
      code: @code,
      description: @description
    }.delete_if { |_k, value| value.nil? }
  end
end
