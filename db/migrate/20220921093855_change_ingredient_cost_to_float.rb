class ChangeIngredientCostToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :ingredients, :purchase_cost, :float
  end
end
