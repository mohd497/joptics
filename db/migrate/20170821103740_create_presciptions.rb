class CreatePresciptions < ActiveRecord::Migration
  def change
    create_table :presciptions do |t|
      t.float :sphere
      t.float :cylinder
      t.integer :axis
      t.float :add
      t.integer :pd

      t.timestamps null: false
    end
  end
end
