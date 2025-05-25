class LTipoUsuario < ApplicationRecord
  has_many :users, dependent: :restrict_with_error

  validates :descricao, presence: true, uniqueness: true
end
