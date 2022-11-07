class AddStoreIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :Reviews, :store_id, :integer
    remove_column :Stores, :store_id, :integer
  end
end
