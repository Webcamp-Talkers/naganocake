class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.integer :enduser_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.string :method_pay
      t.integer :delivery_fee
      t.integer :price_include_tax
      t.integer :order_status
      t.timestamps
    end
  end
end
