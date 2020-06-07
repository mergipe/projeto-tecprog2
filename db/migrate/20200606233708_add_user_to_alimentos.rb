class AddUserToAlimentos < ActiveRecord::Migration[6.0]
  def change
    add_reference :alimentos, :user, null: false, foreign_key: true
  end
end
