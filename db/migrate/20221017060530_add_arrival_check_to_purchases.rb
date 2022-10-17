class AddArrivalCheckToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :arrival_check, :boolean, default: false, null: false
  end
end
