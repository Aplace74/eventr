class Fee < ApplicationRecord
  belongs_to :participation
  has_many :fee_contributions, dependent: :destroy

  def price_per_person
    cost / (fee_contributions.size + 1)
  end
end
