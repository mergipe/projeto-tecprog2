class RemovePorcaoUnidadePorcoesPacoteFromAlimentos < ActiveRecord::Migration[6.0]
  def change
    remove_column :alimentos, :porcao, :float
    remove_column :alimentos, :unidade, :string
    remove_column :alimentos, :porcoes_pacote, :float
  end
end
