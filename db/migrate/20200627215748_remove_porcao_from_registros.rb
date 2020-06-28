class RemovePorcaoFromRegistros < ActiveRecord::Migration[6.0]
  def change
    remove_column :registros, :porcao, :float
  end
end
