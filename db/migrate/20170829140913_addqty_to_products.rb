class AddqtyToProducts < ActiveRecord::Migration
  def change
    add_column :presciptions, :qty, :integer
  end
end
