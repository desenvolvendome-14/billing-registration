class CostCentersFetcher
  def initialize(params)
    @description = params[:description] || nil
  end

  def fetch
    if build_find_hash.empty?
      CostCenter.all
    else
      CostCenter.where(build_find_hash)
    end
  end

  private

  def build_find_hash
    {
      description: @description
    }.delete_if { |_k, value| value.nil? }
  end
end
