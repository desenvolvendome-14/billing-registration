class CostCenter < ApplicationRecord
  validates_presence_of(:description)
end
