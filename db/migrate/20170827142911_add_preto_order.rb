class AddPretoOrder < ActiveRecord::Migration
  def change
    add_column :order_lines, :presciption_id, :integer
  end
end
