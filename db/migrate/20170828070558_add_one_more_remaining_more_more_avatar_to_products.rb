class AddOneMoreRemainingMoreMoreAvatarToProducts < ActiveRecord::Migration
  def change
    add_column :presciptions, :total_cost, :float
  end
end
