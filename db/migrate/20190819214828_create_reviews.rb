class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.column :user_name, :string
      t.column :text, :string


      t.timestamps
    end
  end
end
