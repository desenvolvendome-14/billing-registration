require 'rails_helper'

RSpec.describe CostCenter, type: :model do
  it { should validate_presence_of(:description) }
end
