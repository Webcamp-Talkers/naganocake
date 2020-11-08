class Hostuser::OrdersController < Hostuser::Base
  
  def index
    @endusers = Enduser.all
    @orders = Order.all
    # @order_items = Order_item.all
  end

  def show
    @enduser = Enduser.find(params[:id])
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

  end
  
  private
	def order_params
		  params.require(:order).permit(:order_status)
	end
	
end
