class AddMoreRemainingAvatarToProducts < ActiveRecord::Migration
  def change
    add_column :products, :tenthavatar, :string
    add_column :products, :itemspec, :string
  end
end
