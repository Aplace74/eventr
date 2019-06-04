class Event < ApplicationRecord
  belongs_to :user
  has_many :participations, :supplies
  has_many :users, through: :participation
  has_many :contributions, through: :participation

  validates :title, :address, :city, :zipcode, :start_date, :end_date, presence: true
  validates :start_date, :end_date, inclusion: { in: (Date.today..Date.today+1.years), message: "Invalid date" }

end
end
