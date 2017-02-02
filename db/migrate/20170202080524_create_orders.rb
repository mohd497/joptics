class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :onder_no
      t.integer :customer_id
      t.float :total
      t.date :order_date

      t.timestamps null: false
    end
  end
end
