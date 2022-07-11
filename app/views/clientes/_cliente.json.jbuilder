json.extract! cliente, :id, :nome, :tamanho, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
