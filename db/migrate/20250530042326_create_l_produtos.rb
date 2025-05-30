# frozen_string_literal: true

class CreateLProdutos < ActiveRecord::Migration[7.2]
  def up
    create_table :l_produtos do |t|
      t.references :l_categoria
      t.string     :titulo
      t.text       :descricao
      t.decimal    :preco,    precision: 10, scale: 2
      t.integer    :quantidade_estoque
      t.datetime   :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :l_produtos
  end
end
