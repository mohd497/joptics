class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :customer_id
      t.integer :product_id

      t.timestamps null: false
    end
    add_index :reviews, [:customer_id, :product_id], unique: true
  end
end
