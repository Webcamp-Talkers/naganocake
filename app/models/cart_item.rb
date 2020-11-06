class CartItem < ApplicationRecord
  validates :comment, presence: true
  belongs_to :item
  belongs_to :end_user
  
   def self.total_price
     array = [] #空の配列を用意し、
     Item.all.each do |item|
     array << item.price_before_tax
     end
     array.sum #ここで合計を求める
   end
   
end
