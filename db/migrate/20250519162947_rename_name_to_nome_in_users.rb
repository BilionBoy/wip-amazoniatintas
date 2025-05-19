class RenameNameToNomeInUsers < ActiveRecord::Migration[7.2]
  def change
    if column_exists?(:users, :name)
      rename_column :users, :name, :nome
    end
  end
end
