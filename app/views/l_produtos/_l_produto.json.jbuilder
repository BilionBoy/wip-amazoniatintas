json.extract! l_produto, :id, :l_categoria_id, :titulo, :descricao, :preco, :quantidade_estoque, :created_at, :updated_at
json.url l_produto_url(l_produto, format: :json)
