class AddAddressFormattedAddressToWinery < ActiveRecord::Migration[6.0]
  def change
    add_column :wineries, :address_formatted_address, :string
  end
end
