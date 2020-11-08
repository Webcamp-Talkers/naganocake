class Enduser::OrdersController < Enduser::Base
  def new
    @order = Order.new
    @enduser = current_enduser_enduser
    @shipping = current_enduser_enduser.shippings
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to enduser_orders_thanks_path
  end

  def confirm
    @order = Order.new(order_params)
    @enduser = current_enduser_enduser
    @shipping = current_enduser_enduser.shippings
    # @cart_items = @enduser.cart_items.all

    if params[:order][:order] == '0'
      @order.postal_code = @enduser.postal_code
      @order.address = @enduser.address
      @order.name = @enduser.first_name
    elsif params[:order][:order] == '1'
      @address = Shipping.find(params[:order][:id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
    #render :confirm
  end

  def thanks
  end

  def index
    @enduser = current_enduser_enduser
    @orders = @enduser.orders.all
  end

  def show
    @enduser = current_enduser_enduser
    @orders = @enduser.orders.all
    @order = Order.find(params[:id])
    @shipping = current_enduser_enduser.shippings
  end

  private
   def order_params
   params.require(:order).permit(:enduser_id, :postal_code, :address, :name, :method_pay, :delivery_fee, :order_status)
   #@order = Order.new(params.require(:order).permit(:postal_code, :address, :name, :method_pay))
   end

  # def current_enduser
  #   @enduser = Enduser.find(current_enduser_enduser.id)
  # end
end
