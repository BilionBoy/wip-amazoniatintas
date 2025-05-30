# frozen_string_literal: true

class LProfissional < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  has_one_attached :foto_profissional

  attr_accessor :remove_foto_profissional

  before_save :purge_foto_profissional, if: -> { remove_foto_profissional == '1' }

  validates :nome,          presence: true
  validates :especialidade, presence: true
  validates :descricao,     presence: true

  def purge_foto_profissional
    foto_profissional.purge
  end
  def self.especialidades_padrao
    %w[Residencial Comercial Industrial Decorativo]
  end
end
