class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.boolean :confirmed, default: false
      
      t.timestamps
    end
  end
end
