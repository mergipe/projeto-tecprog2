class RemoveDataHorarioFromRefeicoes < ActiveRecord::Migration[6.0]
  def self.up
    remove_column :refeicoes, :data
    remove_column :refeicoes, :horario
  end
end
