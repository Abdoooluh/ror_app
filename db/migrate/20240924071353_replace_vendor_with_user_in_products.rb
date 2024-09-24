class ReplaceVendorWithUserInProducts < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :products, :vendors
    remove_column :products, :vendor_id

    add_reference :products, :user, null: false, foreign_key: true
  end
end
