class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.string :nearest_station
      t.integer :user_id

      t.timestamps
    end
  end
end
