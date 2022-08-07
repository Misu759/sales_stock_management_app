class AddMenuIdToSales < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :menu_id, :int
  end
end