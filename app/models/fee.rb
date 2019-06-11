class Fee < ApplicationRecord
  belongs_to :participation
  has_many :fee_contributions, dependent: :destroy
end
