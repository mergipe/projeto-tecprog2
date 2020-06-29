class AddIndexToPorcoesReferencia < ActiveRecord::Migration[6.0]
  def change
    add_index :porcoes_referencia, [:alimento_id, :id], unique: true
  end
end
