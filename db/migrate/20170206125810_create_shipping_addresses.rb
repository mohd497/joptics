class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.string :address
      t.string :phone_number
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
