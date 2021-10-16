require 'rails_helper'

RSpec.describe AccountWallet, type: :model do
  it { is_expected.to validate_presence_of(:description) }
end
