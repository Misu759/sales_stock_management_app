class AddCategoryToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :category, :integer, null: false, default: 0
  end
end
