class AddWineReferenceToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmarks, :wines
    add_index :bookmarks, :wine_id
    change_column_null :bookmarks, :wine_id, false
  end
end
