class Item < ApplicationRecord
 enum sales_status: { not_sale: false, on_sale: true }
 validates :name, :price_before_tax, :details, :sales_status, presense: true
 validates :sales_status, inclusion: {in: Item.sales_status.keys }
 
 def toggle_status!
   

      

end
