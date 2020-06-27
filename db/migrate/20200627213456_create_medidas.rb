class CreateMedidas < ActiveRecord::Migration[6.0]
  def change
    create_table :medidas do |t|
      t.float :quantidade
      t.string :unidade

      t.timestamps
    end
  end
end
