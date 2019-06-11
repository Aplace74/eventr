class FeeContribution < ApplicationRecord
  belongs_to :participation
  belongs_to :fee
end
