# frozen_string_literal: true

class LProfissional < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  has_one_attached :foto_profissional

  validates :nome,          presence: true
  validates :especialidade, presence: true
  validates :descricao,     presence: true
end
