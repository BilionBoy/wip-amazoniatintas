class DeviseCreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      ## Devise básico
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recuperação de senha
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Permanecer logado
      t.datetime :remember_created_at

      ## Personalização
      t.string :name, null: false
      t.references :l_tipo_usuario, null: false, foreign_key: true

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
