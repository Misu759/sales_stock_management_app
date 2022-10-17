class AddArrivalDateToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :arrival_date, :date
  end
end
