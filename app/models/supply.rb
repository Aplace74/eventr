class Supply < ApplicationRecord
  belongs_to :category
  belongs_to :event
  has_many :contributions
  has_many :participations, through: :contribution

  validates :quantity, :title, presence: true

  def rest
    rest = quantity
    contributions.each { |c| rest -= c.part }
    return rest
  end
end
