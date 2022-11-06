class AddColumnStore < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :nearest_station, :string
  end
end
