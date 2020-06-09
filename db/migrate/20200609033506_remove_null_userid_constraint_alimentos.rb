class RemoveNullUseridConstraintAlimentos < ActiveRecord::Migration[6.0]
  def change
    change_column_null :alimentos, :user_id, true
  end
end
