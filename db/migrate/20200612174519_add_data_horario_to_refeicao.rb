class AddDataHorarioToRefeicao < ActiveRecord::Migration[6.0]
  def change
    add_column :refeicoes, :data, :date
    add_column :refeicoes, :horario, :time
  end
end
