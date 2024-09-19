wclass RenameProductAttributes < ActiveRecord::Migration[7.2]
  def change
    rename_column :products, :Name, :name
    rename_column :products, :Description, :description
    rename_column :products, :Unit_Cost, :unit_cost
  end

end
