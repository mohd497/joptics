class ChangeTotalPriceFieldType < ActiveRecord::Migration
  def change
    change_column :order_lines, :total_price, :float
    remove_column :order_lines, :float
  end
end
