class SetMetaDefaultValues < ActiveRecord::Migration[6.0]
  def change
    change_column :metas, :energia, :float, :default => 0
    change_column :metas, :carb_total, :float, :default => 0
    change_column :metas, :proteina, :float, :default => 0
    change_column :metas, :gord_total, :float, :default => 0
  end
end
