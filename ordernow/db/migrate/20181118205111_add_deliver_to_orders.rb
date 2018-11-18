class AddDeliverToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :deliver, :boolean
  end
end
