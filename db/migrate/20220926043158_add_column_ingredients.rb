class AddColumnIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :stock, :integer, null: false, default: 0
  end
end
