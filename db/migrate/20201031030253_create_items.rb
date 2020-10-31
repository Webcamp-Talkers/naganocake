class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.integer :price_before_tax, null: false
      t.string :image_id, null: false
      t.text :details, null: false
      t.boolean :sales_status, default: true, null: false
      t.timestamps
    end
  end
end
