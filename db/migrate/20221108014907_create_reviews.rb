class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.string "address"
      t.string "store_reviews"
      t.integer "store_price"
      t.integer "store_id"
      t.integer "user_id"
      t.string "instrument_name"
      t.float "score"

      t.timestamps
    end
  end
end
