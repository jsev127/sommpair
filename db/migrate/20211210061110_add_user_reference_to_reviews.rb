class AddUserReferenceToReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reviews, :user_profiles, column: :user_id
    add_index :reviews, :user_id
    change_column_null :reviews, :user_id, false
  end
end
