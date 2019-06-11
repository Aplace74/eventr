class CreateFees < ActiveRecord::Migration[5.2]
  def change
    create_table :fees do |t|
      t.integer :cost
      t.references :participation, foreign_key: true

      t.timestamps
    end

    create_table :fee_contributions do |t|
      t.references :fee, foreign_key: true
      t.references :participation, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
