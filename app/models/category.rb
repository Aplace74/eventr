class Category < ApplicationRecord
  has_many :supplies
  CATEGORIES = ["Nourriture", "Boissons", "Autres"]

  validates :name, inclusion: { in: CATEGORIES }, presence: true
end