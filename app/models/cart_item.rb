class CartItem < ApplicationRecord
  validates :quantity, :enduser_id, :item_id, presence: true
  belongs_to :item
  belongs_to :enduser
  
  #税込み価格の計算
  def with_tax_price
    (self.item.price_before_tax * 1.1).floor
  end
  
  # 小計の計算
  def sub_total_price
    (self.quantity) * (self.item.price_before_tax*1.1).floor 
  end
  
  
  # def total_price
  
  # array = [] #空の配列を用意し、
  # CartItem.all.each do |item|
  # array << cartitem.price_before_tax 
  # end
  # array.sum #ここで合計を求める
  # end
  
  # def total_price
    # @cart_items = CartItem.all
    # @total_price = 0
    # @cart_items.each do |cart_item|
      # @total_price += cart_item.sub_total_price
    # end
  # end

end
