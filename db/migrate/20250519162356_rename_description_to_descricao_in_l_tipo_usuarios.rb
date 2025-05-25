class RenameDescriptionToDescricaoInLTipoUsuarios < ActiveRecord::Migration[7.2]
  def change
    if column_exists?(:l_tipo_usuarios, :description)
      rename_column :l_tipo_usuarios, :description, :descricao
    end
  end
end
