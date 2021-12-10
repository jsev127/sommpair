class CreateGrapeVarietals < ActiveRecord::Migration[6.0]
  def change
    create_table :grape_varietals do |t|
      t.string :name

      t.timestamps
    end
  end
end
