class CreateJoinTableAlimentoRefeicao < ActiveRecord::Migration[6.0]
  def change
    create_join_table :alimentos, :refeicoes do |t|
      t.index [:alimento_id, :refeicao_id]
    end
  end
end
