class AddColumnStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :review_id, :integer
    remove_column :reviews, :address, :string
  end
end
