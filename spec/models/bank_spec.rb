require 'rails_helper'

RSpec.describe Bank, type: :model do
  it { is_expected.to validate_presence_of(:code) }
  it { is_expected.to validate_presence_of(:description) }
end
