json.extract! l_categoria, :id, :nome, :descricao, :l_segmento_id, :created_at, :updated_at
json.url l_categoria_url(l_categoria, format: :json)
