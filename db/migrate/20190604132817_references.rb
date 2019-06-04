class References < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :user, foreign_key: true

    add_reference :participations, :event, foreign_key: true
    add_reference :participations, :user, foreign_key: true

    add_reference :contributions, :supply, foreign_key: true
    add_reference :contributions, :participation, foreign_key: true

    add_reference :supplies, :category, foreign_key: true
    add_reference :supplies, :event, foreign_key: true
  end
end

