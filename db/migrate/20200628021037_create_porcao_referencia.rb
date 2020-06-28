class CreatePorcaoReferencia < ActiveRecord::Migration[6.0]
  def change
    create_table :porcao_referencia do |t|
      t.float :quantidade
      t.string :unidade
      t.references :alimento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
