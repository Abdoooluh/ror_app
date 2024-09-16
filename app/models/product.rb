class Product < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "description", "id", "name", "sku", "unit_cost", "vendor_id" ]
  end
  def self.ransackable_associations(auth_object = nil)
    [ "vendor" ]
  end
  belongs_to :vendor
  has_many :orders
end
