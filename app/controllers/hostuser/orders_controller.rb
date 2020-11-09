class Hostuser::OrdersController < Hostuser::Base

  def index
    @endusers = Enduser.all
    @orders = Order.all
    # @order_items = Order_item.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to hostuser_orders_path(@order)
  end

  private
	def order_params
		  params.require(:order).permit(:order_status)
	end


end
