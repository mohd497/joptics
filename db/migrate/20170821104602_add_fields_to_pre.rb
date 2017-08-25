class AddFieldsToPre < ActiveRecord::Migration
  def change
    add_column :presciptions, :customer_id, :integer
    add_column :presciptions, :pre_token, :string
  end
end
