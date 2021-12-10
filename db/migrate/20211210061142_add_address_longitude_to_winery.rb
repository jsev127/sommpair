class AddAddressLongitudeToWinery < ActiveRecord::Migration[6.0]
  def change
    add_column :wineries, :address_longitude, :float
  end
end
