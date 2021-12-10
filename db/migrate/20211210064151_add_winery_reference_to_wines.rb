class AddWineryReferenceToWines < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :wines, :wineries
    add_index :wines, :winery_id
    change_column_null :wines, :winery_id, false
  end
end
