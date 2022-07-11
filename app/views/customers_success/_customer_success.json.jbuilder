json.extract! customer_success, :id, :nome, :nivel, :status, :created_at, :updated_at
json.url customer_success_url(customer_success, format: :json)
