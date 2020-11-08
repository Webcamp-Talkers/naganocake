class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy


  belongs_to :enduser

  enum method_pay: {クレジットカード:1, 銀行振込:2}

  enum order_status: {入金待ち:1, 入金確認:2, 制作中:3, 発送準備中:4, 発送済み:5}

end
