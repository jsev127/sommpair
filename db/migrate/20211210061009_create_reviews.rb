class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :wine_id
      t.text :comment
      t.string :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
