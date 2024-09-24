class RemoveVendorTypeFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :vendor_type, :string
  end
end
