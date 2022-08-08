class CreateWastes < ActiveRecord::Migration[6.0]
  def change
    create_table :wastes do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.integer :amount, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
