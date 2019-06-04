class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.string :title
      t.date :start_date
      t.date :end_date
      t.string :picture
      t.string :address
      t.string :city
      t.string :zipcode

      t.timestamps
    end
  end
end
