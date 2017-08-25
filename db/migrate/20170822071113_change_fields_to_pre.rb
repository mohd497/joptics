class ChangeFieldsToPre < ActiveRecord::Migration
  def change
    change_column :presciptions, :pd, :float
  end
end
