class AddMedidaToRegistro < ActiveRecord::Migration[6.0]
  def change
    add_reference :registros, :medida, null: false, foreign_key: true
  end
end
