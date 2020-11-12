class Hostuser::OrderItemsController < Hostuser::Base

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.make_status = params[:order_item][:make_status]
    @order_item.update(order_item_params)
    @order_items = OrderItem.where(order_id: @order_item.order_id)
    if @order_item.make_status == "製作中"
      @order_item.order.update(order_status: "製作中")
    elsif @order_item.make_status == "製作完了"
      complete_status = @order_items.pluck(:make_status).grep("製作完了")
      if complete_status.size == @order_items.count
        @order_item.order.update(order_status: "発送準備中")
      end
    end
    if @order_item.update(order_item_params)
      flash[:notice] = "製作ステータスを更新しました"
      redirect_to hostuser_order_path(@order_item.order)
    else
      render "show"
    end
  end

  private
  def order_item_params
    params.require(:order_item).permit(:make_status)
  end

end

