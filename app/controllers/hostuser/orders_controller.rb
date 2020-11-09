class Hostuser::OrdersController < Hostuser::Base
  def index
    @endusers = Enduser.all
    @enduser = current_enduser_enduser
    @orders = Orders.page(params[:page]).reverse_order
  end

  def show
    @enduser = Enduser.find(params[:id])
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
  end
end
