class Hostuser::OrdersController < Hostuser::Base

  def index
    @endusers = Enduser.all
    @orders = Order.all
    @order_items = Order_item.all
  end

  def show
    @enduser = current_enduser_enduser
    @orders = @enduser.orders.all
    @order = Order.find(params[:id])
    @shipping = current_enduser_enduser.shippings
  end

  def update
    @order = Order.find(params[:id])
  end

  private
	def order_params
		  params.require(:order).permit(:order_status)
	end


end
