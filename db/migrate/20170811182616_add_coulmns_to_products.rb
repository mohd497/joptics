class AddCoulmnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :frames, :string
    add_column :products, :shapes, :string
    add_column :products, :material, :string
    add_column :products, :size, :string
    add_column :products, :color, :string
    add_column :products, :rx_type, :string
  end
end
