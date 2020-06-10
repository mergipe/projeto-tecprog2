class CreateRefeicoes < ActiveRecord::Migration[6.0]
  def change
    create_table :refeicoes do |t|
      t.string :nome
      t.date :data
      t.time :horario
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
