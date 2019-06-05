class Category < ApplicationRecord
  has_many :supplies
  CATEGORIES = ["Nourriture", "Boissons", "Autres"]

  validates :name, inclusion: { in: ["Nourriture", "Boissons", "Autres"] }, presence: true
end