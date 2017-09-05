class AddMoreFieldsToPre < ActiveRecord::Migration
  def change
    add_column :presciptions, :sphere_right, :float
    add_column :presciptions, :cylinder_right, :float
    add_column :presciptions, :axis_right, :float
    add_column :presciptions, :add_right, :integer
    add_column :presciptions, :pd_right, :float
  end
end
