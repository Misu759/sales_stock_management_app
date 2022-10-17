class RemoveDeliveryCostFromPurchases < ActiveRecord::Migration[6.0]
  def up
    remove_column :purchases, :delivery_cost, :integer
  end

  def down
    add_column :purchases, :delivery_cost, :integer
  end
end
