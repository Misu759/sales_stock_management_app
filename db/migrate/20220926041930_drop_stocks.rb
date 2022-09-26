class DropStocks < ActiveRecord::Migration[6.0]
  def change
    drop_table :stocks do |t|
      t.integer "ingredient_id"
      t.integer "amount"
      t.index ["ingredient_id"], name: "index_stocks_on_ingredient_id"
      t.timestamps
    end
  end
end
