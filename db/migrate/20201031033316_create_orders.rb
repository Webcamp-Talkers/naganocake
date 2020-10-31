class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.integer :enduser_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.string :method_pay, null: false
      t.integer :delivery_fee, null: false
      t.integer :price_include_tax, null: false
      t.integer :order_status, null: false
      t.timestamps
    end
  end
end
