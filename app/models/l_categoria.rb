# frozen_string_literal: true

class LCategoria < ApplicationRecord
  self.table_name = 'l_categorias'

  belongs_to :l_segmento    
end
