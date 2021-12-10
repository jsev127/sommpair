class CreateWineries < ActiveRecord::Migration[6.0]
  def change
    create_table :wineries do |t|
      t.string :name
      t.string :address
      t.text :website
      t.integer :region_id

      t.timestamps
    end
  end
end
