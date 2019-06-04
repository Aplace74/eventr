class Event < ApplicationRecord
  belongs_to :user
  has_many :participations, :supplies
  has_many :users, through: :participation
  has_many :contributions, through: :participation
end
