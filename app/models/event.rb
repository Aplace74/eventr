class Event < ApplicationRecord
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :supplies, dependent: :destroy
  has_many :users, through: :participation
  has_many :contributions, through: :participation
  has_many :fees, through: :participations

  validates :title, :address, :city, :zipcode, :start_date, :end_date, presence: true
  validates :start_date, :end_date, inclusion: { in: (Date.today..Date.today+1.years), message: "Invalid date" }
  mount_uploader :picture, PhotoUploader
end
