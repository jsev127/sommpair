class AddCountryReferenceToRegions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :regions, :countries
    add_index :regions, :country_id
    change_column_null :regions, :country_id, false
  end
end
