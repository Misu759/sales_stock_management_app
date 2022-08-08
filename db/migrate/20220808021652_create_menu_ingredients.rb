class CreateMenuIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_ingredients do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
