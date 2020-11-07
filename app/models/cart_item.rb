class CartItem < ApplicationRecord
  validates :quantity, presence: true
  belongs_to :item
  belongs_to :enduser
  
   def self.sum_price
     array = [] #空の配列を用意し、
     Item.all.each do |item|
     array << item.price_before_tax
     end
     array.sum #ここで合計を求める
   end
   
end
