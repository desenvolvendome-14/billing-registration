require "rails_helper"

RSpec.describe ChargeType, type: :model do
  it { is_expected.to validate_presence_of(:description) }
end
