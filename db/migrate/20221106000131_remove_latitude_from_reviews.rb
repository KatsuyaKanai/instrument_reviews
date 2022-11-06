class RemoveLatitudeFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :latitude
    remove_column :reviews, :longitude
  end
end
