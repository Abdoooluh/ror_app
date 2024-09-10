json.extract! order, :id, :user_id, :product_id, :order_number, :status, :created_at, :updated_at
json.url order_url(order, format: :json)
