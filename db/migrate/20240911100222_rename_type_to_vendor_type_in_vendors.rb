class RenameTypeToVendorTypeInVendors < ActiveRecord::Migration[7.2]
  def change
    rename_column :vendors, :type, :vendor_type
  end
end
