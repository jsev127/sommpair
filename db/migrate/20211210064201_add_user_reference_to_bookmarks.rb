class AddUserReferenceToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmarks, :user_profiles, column: :user_id
    add_index :bookmarks, :user_id
    change_column_null :bookmarks, :user_id, false
  end
end
