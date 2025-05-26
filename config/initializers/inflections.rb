# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'l_tipo_usuario', 'l_tipo_usuarios'
  inflect.irregular 'l_segmento',     'l_segmentos'
  inflect.irregular 'l_categoria',    'l_categorias' 

end
