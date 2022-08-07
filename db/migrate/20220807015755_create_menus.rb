class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.integer :regular_cost
      t.text :description

      t.timestamps
    end
  end
end
