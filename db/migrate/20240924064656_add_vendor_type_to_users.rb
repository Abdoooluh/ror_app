class AddVendorTypeToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :vendor_type, :string
  end
end
