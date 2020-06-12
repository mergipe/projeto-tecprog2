class AddPorcaoToAlimentoRefeicao < ActiveRecord::Migration[6.0]
  def change
    add_column :alimentos_refeicoes, :porcao, :float
  end
end
