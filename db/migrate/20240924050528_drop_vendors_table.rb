class DropVendorsTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :vendors
  end

  def down
    create_table :vendors do |t|
      t.string :email
      t.string :password
      t.string :full_name
      t.string :cell_number
      t.references :city, foreign_key: true
      t.timestamps
    end
  end
end
