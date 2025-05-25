class LTipoUsuario < ApplicationRecord
  has_many :users, dependent: :restrict_with_error
  
  validates :descricao, presence: true, uniqueness: true
  
  
  before_save :upcase_descricao
  
  private
  
  def upcase_descricao
    self.descricao = descricao.upcase if descricao.present?
  end
end
