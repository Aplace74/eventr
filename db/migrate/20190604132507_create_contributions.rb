class CreateContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :contributions do |t|
      t.integer :part
      t.boolean :state

      t.timestamps
    end
  end
end
