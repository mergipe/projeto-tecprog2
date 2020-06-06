class CreateAlimentos < ActiveRecord::Migration[6.0]
  def change
    create_table :alimentos do |t|
      t.string :nome
      t.string :marca
      t.float :porcao
      t.string :unidade
      t.float :porcoes_pacote
      t.float :energia
      t.float :proteina
      t.float :carb_total
      t.float :carb_disp
      t.float :fibra
      t.float :acucar
      t.float :gord_total
      t.float :gord_sat
      t.float :gord_mono
      t.float :gord_poli
      t.float :gord_trans
      t.float :colesterol
      t.float :sodio

      t.timestamps
    end
  end
end
