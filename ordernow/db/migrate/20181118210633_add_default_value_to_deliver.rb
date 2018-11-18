class AddDefaultValueToDeliver < ActiveRecord::Migration
    def up
      change_column :orders, :deliver, :boolean, default: false
    end

    def down
      change_column :orders, :deliver, :boolean
    end
end
