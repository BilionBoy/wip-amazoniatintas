class CreateLTipoUsuarios < ActiveRecord::Migration[7.2]
  def up
    create_table :l_tipo_usuarios do |t|
      t.string :description, null: false
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :l_tipo_usuarios
  end
end
