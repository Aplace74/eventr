class Fee < ApplicationRecord
  belongs_to :participation
  has_many :fee_contributions, dependent: :destroy

  validates :cost, presence: true
  validates :cost, numericality: { greater_than_or_equal_to: 2 }

  def price_per_person
    cost / (fee_contributions.size + 1)
  end
end
