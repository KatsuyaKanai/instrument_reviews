class AddColumnStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :user_id, :integer
  end
end
