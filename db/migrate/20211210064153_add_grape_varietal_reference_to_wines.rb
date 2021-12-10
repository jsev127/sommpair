class AddGrapeVarietalReferenceToWines < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :wines, :grape_varietals
    add_index :wines, :grape_varietal_id
    change_column_null :wines, :grape_varietal_id, false
  end
end
