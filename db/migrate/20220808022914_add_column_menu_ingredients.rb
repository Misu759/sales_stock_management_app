class AddColumnMenuIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :menu_ingredients, :amount, :integer
  end
end
