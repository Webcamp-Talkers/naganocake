class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      
      t.integer :genre_id
      t.string :name
      t.integer :price_before_tax
      t.string :image_id
      t.text :details
      t.boolean :sales_status, default: true
      t.timestamps
    end
  end
end
