class AddProductIdToLense < ActiveRecord::Migration
  def change
    add_column :presciptions, :product_id, :integer
  end
end
