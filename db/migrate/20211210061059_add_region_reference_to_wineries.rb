class AddRegionReferenceToWineries < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :wineries, :regions
    add_index :wineries, :region_id
    change_column_null :wineries, :region_id, false
  end
end
