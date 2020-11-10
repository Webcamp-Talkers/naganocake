class Hostuser::OrderItemsController < Hostuser::Base

  def update
    @order_item = OrderItem.find(params[:id])
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

