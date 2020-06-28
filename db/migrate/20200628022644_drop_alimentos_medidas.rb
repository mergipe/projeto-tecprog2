class DropAlimentosMedidas < ActiveRecord::Migration[6.0]
  def change
    drop_table :alimentos_medidas
  end
end
