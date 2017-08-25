class AddTypeOfToLense < ActiveRecord::Migration
  def change
    add_column :presciptions, :lense_type, :string
  end
end
