class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.integer :winery_id
      t.integer :grape_varietal_id
      t.integer :vintage
      t.integer :category_id
      t.integer :description_id

      t.timestamps
    end
  end
end
