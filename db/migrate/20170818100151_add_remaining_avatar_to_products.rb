class AddRemainingAvatarToProducts < ActiveRecord::Migration
  def change
    add_column :products, :thirdavatar, :string
    add_column :products, :fourthavatar, :string
    add_column :products, :fifthavatar, :string
    add_column :products, :sixthavatar, :string
    add_column :products, :seventhavatar, :string
    add_column :products, :eighthavatar, :string
  end
end
