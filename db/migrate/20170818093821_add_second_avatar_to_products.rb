class AddSecondAvatarToProducts < ActiveRecord::Migration
  def change
    add_column :products, :secavatar, :string
  end
end
