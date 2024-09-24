class Product < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "sku", "unit_cost", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  belongs_to :user # This replaces belongs_to :vendor
  has_many :orders
end
