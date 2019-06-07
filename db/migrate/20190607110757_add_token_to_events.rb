class AddTokenToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :token, :string
  end
end
