class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :data
      t.text :description
      t.float :value

      t.timestamps null: false
    end
  end
end
