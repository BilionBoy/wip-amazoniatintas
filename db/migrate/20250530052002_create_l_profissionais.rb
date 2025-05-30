# frozen_string_literal: true

class CreateLProfissionais < ActiveRecord::Migration[7.2]
  def up
    create_table :l_profissionais do |t|
      t.string   :nome
      t.string   :especialidade
      t.string   :descricao
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :l_profissionais
  end
end
