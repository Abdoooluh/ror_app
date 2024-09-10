json.extract! product, :id, :sku, :vendor_id, :created_at, :updated_at
json.url product_url(product, format: :json)
