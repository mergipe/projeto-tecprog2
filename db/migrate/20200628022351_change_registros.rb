class ChangeRegistros < ActiveRecord::Migration[6.0]
  def change
    remove_column :registros, :medida_id
    add_column :registros, :quantidade, :float
    add_column :registros, :unidade, :string
  end
end
