class ChangeColumnsAddUniqueToMenuIngredients < ActiveRecord::Migration[6.0]
  def change
    add_index :menu_ingredients, [:menu_id, :ingredient_id], unique: true 
  end
end
