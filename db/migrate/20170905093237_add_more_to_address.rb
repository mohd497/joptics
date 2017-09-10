class AddMoreToAddress < ActiveRecord::Migration
  def change
    add_column :shipping_addresses, :first_name, :string
    add_column :shipping_addresses, :last_name, :string
    add_column :shipping_addresses, :email, :string
    add_column :shipping_addresses, :country, :string
    add_column :shipping_addresses, :province, :string
    add_column :shipping_addresses, :city, :string
    add_column :shipping_addresses, :postal_code, :string
    add_column :shipping_addresses, :shipping_country, :string
    add_column :shipping_addresses, :shipping_address, :string
    add_column :shipping_addresses, :shipping_province, :string
    add_column :shipping_addresses, :shipping_city, :string
    add_column :shipping_addresses, :shipping_postal_code, :string
   end
end
