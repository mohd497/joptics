class ChangeOrderFieldName < ActiveRecord::Migration
  def change
    rename_column :orders, :onder_no, :order_no
  end
end
