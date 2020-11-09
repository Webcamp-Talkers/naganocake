class Hostuser::OrderItemsController < Hostuser::Base

  def update
    @order_item = OderItems.find(params[:id])
    if @order_item.update(order_item_params)
      redirect_to hostuser_order_path(@order_item.order)
    else
      render "show"
    end
  end

  private
  def order_item_params
    params.require(:order_items).permit(:production_status)
  end

end

