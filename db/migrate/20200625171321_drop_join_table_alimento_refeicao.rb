require_relative "20200612032554_create_join_table_alimento_refeicao.rb"

class DropJoinTableAlimentoRefeicao < ActiveRecord::Migration[6.0]
  def change
    revert CreateJoinTableAlimentoRefeicao
  end
end
