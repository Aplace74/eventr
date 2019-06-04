class Contribution < ApplicationRecord
  belongs_to :supply
  belongs_to :participation

  validates :part, presence: true
end
