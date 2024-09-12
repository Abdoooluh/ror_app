class AddAttributesToProduct < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :Name, :string
    add_column :products, :Unit_Cost, :float
    add_column :products, :Description, :string
  end
end
