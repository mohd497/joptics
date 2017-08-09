class AddCatVariablesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :newarrivals, :boolean
    add_column :products, :bestselling, :boolean
    add_column :products, :popularbrand, :boolean
    add_column :products, :brand, :string
  end
end
