class Participation < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :contributions, dependent: :destroy
  has_many :fee_contributions, dependent: :destroy
  has_one :fee, dependent: :destroy

  validates :user_id, uniqueness: { scope: :event_id, message: "Vous avez déjà accepté de participer! Rendez-vous à la page de l'événement" }
end
