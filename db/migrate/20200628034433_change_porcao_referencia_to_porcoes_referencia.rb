class ChangePorcaoReferenciaToPorcoesReferencia < ActiveRecord::Migration[6.0]
  def change
    rename_table :porcao_referencia, :porcoes_referencia
  end
end
