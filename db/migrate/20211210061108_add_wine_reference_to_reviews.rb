class AddWineReferenceToReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reviews, :wines
    add_index :reviews, :wine_id
    change_column_null :reviews, :wine_id, false
  end
end
