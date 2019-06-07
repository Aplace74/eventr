class Category < ApplicationRecord
  has_many :supplies
  
  # CATEGORIES = ["Nourriture", "Boissons", "Autres"]

  # validates :name, inclusion: { in: ["Nourriture", "Boissons", "Autres"] }, presence: true

  def status(event)
    state = 0
    category_supplies(event).each do |supply|
      state += 1 if supply.rest.zero?
    end
    return state
  end

  def category_supplies(event)
    return supplies.where(event_id: event.id).where(category_id: id)
  end
end
