class ChartsAccountsFetcher
  def initialize(params)
    @internal_code = params[:internal_code] || nil
    @description = params[:description] || nil
  end

  def fetch
    if build_find_hash.empty?
      ChartsAccount.all
    else
      ChartsAccount.where(build_find_hash)
    end
  end

  private

  def build_find_hash
    {
      internal_code: @internal_code,
      description: @description
    }.delete_if { |_k, value| value.nil? }
  end
end
