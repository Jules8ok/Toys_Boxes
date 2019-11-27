class RemoveCartFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orders, :cart, null: true, foreign_key: true
  end
end
