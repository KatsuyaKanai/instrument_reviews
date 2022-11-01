class AddColumnReviews < ActiveRecord::Migration[6.1]
  def up
    add_column :reviews, :user_id, :integer 
  end
end
