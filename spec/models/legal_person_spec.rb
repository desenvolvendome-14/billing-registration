require 'rails_helper'

RSpec.describe LegalPerson, type: :model do
  it { is_expected.to validate_presence_of(:corporate_name) }
  it { is_expected.to validate_presence_of(:fantasy_name) }
  it { is_expected.to validate_presence_of(:state_registration) }
  it { is_expected.to validate_presence_of(:municipal_registration) }
  it { is_expected.to validate_presence_of(:municipal_registration) }
end
