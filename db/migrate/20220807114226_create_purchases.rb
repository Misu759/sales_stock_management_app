class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.belongs_to :ingredient
      t.integer :amount, null: false
      t.date :purchase_date, null: false
      t.date :waste_date
      t.integer :delivery_cost

      t.timestamps
    end
  end
end
