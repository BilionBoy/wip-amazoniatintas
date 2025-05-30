json.extract! l_evento, :id, :titulo, :conteudo, :data_evento, :l_categoria_id, :created_at, :updated_at
json.url l_evento_url(l_evento, format: :json)
