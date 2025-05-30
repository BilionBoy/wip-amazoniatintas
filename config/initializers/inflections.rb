# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'l_tipo_usuario', 'l_tipo_usuarios'
  inflect.irregular 'l_segmento',     'l_segmentos'
  inflect.irregular 'l_categoria',    'l_categorias' 
  inflect.irregular 'l_produto',      'l_produtos'
  inflect.irregular 'l_profissional', 'l_profissionais'
  inflect.irregular 'l_evento', 'l_eventos'

end
