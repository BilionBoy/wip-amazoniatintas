# frozen_string_literal: true

class LCategoria < ApplicationRecord
  self.table_name = 'l_categorias'

  belongs_to :l_segmento 
  has_many   :l_produtos, dependent: :destroy   


  # Método para gerar um ID para as tabs
  def tab_id
    "categoria-#{id}"
  end
end
