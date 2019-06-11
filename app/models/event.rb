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

  def agenda_url
    text = title.split(" ").join("+")
    details = self.description.split(" ").join("+")
    location = (self.address.split(" ") + self.city.split(" ")).join("+")
    first_day = "#{self.start_date.year}#{self.start_date.strftime("%m")}#{self.start_date.strftime("%d")}"
    self.end_date = self.start_date if self.end_date.blank? || self.end_date.nil?
    last_date = self.end_date + 1.day
    last_day = "#{last_date.year}#{last_date.strftime("%m")}#{last_date.strftime("%d")}"
    agenda_url = "https://www.google.com/calendar/render?action=TEMPLATE&text=#{text}&details=#{details}&location=#{location}&dates=#{first_day}%2F#{last_day}"
  end

  def map_url
    (address.split(" ") + city.split(" ")).join("+")
  end
end

