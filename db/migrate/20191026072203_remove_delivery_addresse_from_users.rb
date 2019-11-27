class RemoveDeliveryAddresseFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :delivery_address, :string
    remove_column :orders, :address, :string
  end
end
