class RenameNameColumnToStores < ActiveRecord::Migration[6.1]
  def change
    rename_column :stores, :name, :store_name
    add_column :stores, :name, :string
  end
end
