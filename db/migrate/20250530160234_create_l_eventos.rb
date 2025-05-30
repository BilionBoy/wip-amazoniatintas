# frozen_string_literal: true

class CreateLEventos < ActiveRecord::Migration[7.2]
  def up
    create_table :l_eventos do |t|
      t.string     :titulo
      t.text       :conteudo
      t.datetime   :data_evento
      t.references :l_categoria
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :l_eventos
  end
end
