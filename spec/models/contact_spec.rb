require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:phone) }
  it { is_expected.to validate_presence_of(:cellphone) }
  it { is_expected.to validate_presence_of(:email) }

  it { is_expected.to validate_presence_of :status }
  it { is_expected.to define_enum_for(:status).with_values({ commercial: 1, residential: 2}) }
end
