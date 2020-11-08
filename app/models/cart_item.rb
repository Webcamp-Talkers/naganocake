class CartItem < ApplicationRecord
  validates :quantity, presence: true
  belongs_to :item
  belongs_to :enduser
  
  #税込み価格の計算
  def with_tax_price
    (self.item.price_before_tax * 1.1).floor
  end
  
  # 小径の
  def sub_total_price
    (self.quantity) * (self.item.price_before_tax*1.1).floor 
  end
  
  def total_price
  
  array = [] #空の配列を用意し、
  Item.all.each do |item|
  array << item.price 
  
  end
  array.sum #ここで合計を求める
  end

end
