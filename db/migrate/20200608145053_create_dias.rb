class CreateDias < ActiveRecord::Migration[6.0]
  def change
    create_table :dias do |t|
      t.date :data
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
