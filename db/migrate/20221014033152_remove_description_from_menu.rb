class RemoveDescriptionFromMenu < ActiveRecord::Migration[6.0]
  def change
    remove_column :menus, :description, :text
  end
end
