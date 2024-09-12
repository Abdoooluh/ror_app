class Order < ApplicationRecord
  enum status: { pending: "pending", in_process: "in_process", delivered: "delivered" }
  belongs_to :user
  belongs_to :product

  def self.ransackable_attributes(auth_object = nil)
    [ "status", "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "product", "user" ]
  end
end
