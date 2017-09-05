class AddPreFieldsToPre < ActiveRecord::Migration
  def change
    add_column :presciptions, :pre_type, :string
  end
end
