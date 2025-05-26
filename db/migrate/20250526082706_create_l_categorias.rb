# frozen_string_literal: true

class CreateLCategorias < ActiveRecord::Migration[7.2]
  def up
    create_table :l_categorias do |t|
      t.string :nome
      t.text :descricao
      t.references :l_segmento
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :l_categorias
  end
end
