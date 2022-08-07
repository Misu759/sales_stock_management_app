class AddColumToSaleDate < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :date, :date, null: false
  end
end