# frozen_string_literal: true

class LProduto < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :l_categoria

  validates :titulo, presence: true
  validates :descricao, presence: true
  validates :preco,              presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantidade_estoque, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :l_categoria, presence: true
end
