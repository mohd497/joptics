class AddOneMoreRemainingWerAvatarToProducts < ActiveRecord::Migration
  def change
    add_column :presciptions, :cost, :float
  end
end
