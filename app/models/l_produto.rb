class LProduto < ApplicationRecord
  belongs_to :l_categoria
  has_one_attached :foto_produto

  attr_accessor :remove_foto_produto

  before_save :purge_foto_produto, if: -> { remove_foto_produto == '1' }

  validates :titulo,             presence: true
  validates :descricao,          presence: true
  validates :preco,              presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantidade_estoque, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :l_categoria,        presence: true

  def purge_foto_produto
    foto_produto.purge
  end

  def preco_formatado
    "R$ #{preco.to_f.round(2).to_s.gsub('.', ',')}"
  end
  
  def em_estoque?
    quantidade_estoque.to_i > 0
  end
end
