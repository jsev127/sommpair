class AddCategoryReferenceToWines < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :wines, :categories
    add_index :wines, :category_id
    change_column_null :wines, :category_id, false
  end
end
