class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :store_name
      t.string :store_address
      t.string :store_reviews
      t.integer :store_price

      t.timestamps
    end
  end
end
