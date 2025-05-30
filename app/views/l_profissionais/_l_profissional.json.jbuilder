json.extract! l_profissional, :id, :nome, :especialidade, :descricao, :created_at, :updated_at
json.url l_profissional_url(l_profissional, format: :json)
