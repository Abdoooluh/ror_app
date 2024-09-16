class RemoveOrderNumberFromOrders < ActiveRecord::Migration[7.2]
  def change
    remove_column :orders, :order_number, :string
  end
end
