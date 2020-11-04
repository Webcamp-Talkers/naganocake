class Item < ApplicationRecord
 enum sales_status: { 販売停止中: 0, 販売中: 1 }
 validates :name, :price_before_tax, :details, :sales_status, presence: true
 validates :sales_status, inclusion: {in: Item.sales_statuses.keys }
 attachment :image
 has_many :genre, dependent: :destroy

  def toggle_status!
   if not_sale?
     on_sale!
   else
     not_sale!
   end
  end

end
