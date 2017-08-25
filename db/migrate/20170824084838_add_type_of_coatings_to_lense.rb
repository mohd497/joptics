class AddTypeOfCoatingsToLense < ActiveRecord::Migration
  def change
    add_column :presciptions, :protective_coating, :boolean, default: false
    add_column :presciptions, :scratch_resistant_coating, :boolean, default: false
    add_column :presciptions, :anti_reflective_coating, :boolean, default: false
  end
end
