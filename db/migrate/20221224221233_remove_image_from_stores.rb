class RemoveImageFromStores < ActiveRecord::Migration[6.1]
  def change
    remove_column :stores, :image, :string
  end
end
