class OrderItem < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum make_status: {"着手不可": 0,"製作待ち": 1,"製作中": 2,"製作完了": 3}

  # after_update do
  #   order_items = order.order_items
  #   if order_items.any? {|order_item| order_item.make_status == "製作中"} == true # 条件分岐：製作ステータスが1つでも製作中だったら
  #     order.update(order_status: "製作中") # 注文ステータスを製作中に変更する
  #   elsif order_items.all? {|order_item| order_item.make_status == "製作完了"} == true # 条件分岐：製作ステータスが全て製作完了だったら
  #   order.update(order_status: "発送待ち") # 注文ステータスを発送準備中に変更する
  #   end
  # end

end
