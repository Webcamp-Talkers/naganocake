class Item < ApplicationRecord
 enum sales_status: { 販売停止中: 0, 販売中: 1 }
 validates :name, :price_before_tax, :details, :sales_status, :genre_id, presence: true
 validates :sales_status, inclusion: {in: Item.sales_statuses.keys }
 attachment :image
 belongs_to :genre
 has_many :cart_items

  def toggle_status!
   if not_sale?
     on_sale!
   else
     not_sale!
   end
  end

end
