class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.belongs_to :ingredient
      t.integer :amount

      t.timestamps
    end
  end
end
