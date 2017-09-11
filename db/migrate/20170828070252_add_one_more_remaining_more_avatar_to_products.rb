class AddOneMoreRemainingMoreAvatarToProducts < ActiveRecord::Migration
  def change
    add_column :presciptions, :order_id, :integer
  end
end
