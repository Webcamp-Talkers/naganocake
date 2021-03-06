class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy


  belongs_to :enduser

  enum method_pay: {"クレジットカード":0, "銀行振込":1}


  enum order_status: {"入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済み":4}


  # validates :method_pay, presence: true

  validates :method_pay, presence: true


  # after_update do
  #   if order_status == "入金確認"  #selfはクラスメゾット
  #     order_items.each {
  #       |order_item|order_item.update(make_status: "製作待ち")
  #     }
  #   end
  # end

end
