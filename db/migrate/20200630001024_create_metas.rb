class CreateMetas < ActiveRecord::Migration[6.0]
  def change
    create_table :metas do |t|
      t.float :energia
      t.float :carb_total
      t.float :proteina
      t.float :gord_total
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
