# frozen_string_literal: true

class CreateTitulos < ActiveRecord::Migration[7.2]
  def up
    create_table :titulos do |t|
      t.string :conteudo_text
      t.datetime :data_evento
      t.references :l_categoria
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :titulos
  end
end
