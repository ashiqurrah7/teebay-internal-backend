json.extract! product, :id, :title, :desc, :categories, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
