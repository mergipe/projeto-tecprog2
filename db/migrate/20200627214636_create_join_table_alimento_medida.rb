class CreateJoinTableAlimentoMedida < ActiveRecord::Migration[6.0]
  def change
    create_join_table :alimentos, :medidas do |t|
      t.index [:alimento_id, :medida_id]
      # t.index [:medida_id, :alimento_id]
    end
  end
end
