class Item < ApplicationRecord
 enum sales_status: { not_sale: 0, on_sale: 1 }
 validates :name, :price_before_tax, :details, :sales_status, presence: true
 validates :sales_status, inclusion: {in: Item.sales_statuses.keys }
 attachment :image

  def toggle_status!
   if not_sale?
     on_sale!
   else
     not_sale!
   end
  end

end
