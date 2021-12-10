class AddReviewCountToWines < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :reviews_count, :integer
  end
end
