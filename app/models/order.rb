class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy


  belongs_to :enduser

  enum method_pay: {クレジットカード:1, 銀行振込:2}

  enum order_status: {入金待ち:0, 入金確認:1, 制作中:2, 発送準備中:3, 発送済み:4}

end
