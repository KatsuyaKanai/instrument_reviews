class AddReviewsTitleToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :reviews_title, :string
  end
end
