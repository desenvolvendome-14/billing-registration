require 'rails_helper'

RSpec.describe ChargeType, type: :model do
  it { should validate_presence_of(:description) }
end
