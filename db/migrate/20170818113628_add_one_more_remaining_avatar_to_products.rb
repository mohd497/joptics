class AddOneMoreRemainingAvatarToProducts < ActiveRecord::Migration
  def change
    add_column :products, :ninthavatar, :string
  end
end
