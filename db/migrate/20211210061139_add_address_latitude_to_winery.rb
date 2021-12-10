class AddAddressLatitudeToWinery < ActiveRecord::Migration[6.0]
  def change
    add_column :wineries, :address_latitude, :float
  end
end
