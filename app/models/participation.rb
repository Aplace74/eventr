class Participation < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :contributions
end
