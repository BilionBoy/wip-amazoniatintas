class User < ApplicationRecord
  belongs_to :l_tipo_usuario

  # Devise modules (registrable desativado para impedir cadastro externo)
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  # Validações básicas
  validates :name, presence: true
end
