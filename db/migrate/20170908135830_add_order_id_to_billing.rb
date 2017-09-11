class AddOrderIdToBilling < ActiveRecord::Migration
  def change
    add_column :shipping_addresses, :order_id, :integer
  end
end
