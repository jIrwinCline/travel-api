class AddForeignKeyForReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :place_id, :integer
    add_foreign_key :reviews, :places
  end
end
