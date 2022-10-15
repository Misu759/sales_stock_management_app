class CreateSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string :name, unique: true, null: false
      t.integer :delivery_cost, null: false, default: 0
      t.string :phone_number

      t.timestamps
    end
  end
end
