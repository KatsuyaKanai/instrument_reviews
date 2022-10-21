class AddColumnReviews < ActiveRecord::Migration[6.1]
  def up
    add_column :reviews, :instrument_name, :string
  end
end
