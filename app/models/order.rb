class Order < ApplicationRecord

  enum status: { pending: "pending", in_process: "in_process", delivered: "delivered" }
  belongs_to :user
  belongs_to :product
end
