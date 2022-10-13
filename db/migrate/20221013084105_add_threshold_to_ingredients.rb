class AddThresholdToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :threshold, :integer
    add_column :ingredients, :unit_amount, :integer, null: false
  end
end
