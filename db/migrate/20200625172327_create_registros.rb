class CreateRegistros < ActiveRecord::Migration[6.0]
  def change
    create_table :registros do |t|
      t.float :porcao
      t.references :alimento, null: false, foreign_key: true
      t.references :refeicao, null: false, foreign_key: true

      t.timestamps
    end
  end
end
