class AddUnusedToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :unused_amount, :integer
  end
end
