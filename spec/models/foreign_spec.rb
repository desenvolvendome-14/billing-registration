require 'rails_helper'

RSpec.describe Foreign, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:cell_phone) }
end
