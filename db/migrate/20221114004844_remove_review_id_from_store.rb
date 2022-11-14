class RemoveReviewIdFromStore < ActiveRecord::Migration[6.1]
  def change
    remove_column :stores, :review_id, :integer
  end
end
