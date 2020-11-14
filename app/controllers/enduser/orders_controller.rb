class Enduser::OrdersController < Enduser::Base
  before_action :authenticate_enduser_enduser!
  def new
    @order = Order.new
    @enduser = current_enduser_enduser
    @shipping = current_enduser_enduser.shippings
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @enduser = current_enduser_enduser
    Shipping.create(enduser_id: @enduser.id, postal_code: @order.postal_code, address: @order.address, name: @order.name)
    @enduser = current_enduser_enduser
    @carts = CartItem.all
    @carts.each do |cart_item|
      @order_item = @order.order_items.new
      @order_item.order_id = @order.id
      @order_item.item_id = cart_item.item_id
      @order_item.quantity = cart_item.quantity
      @order_item.order_price = cart_item.sub_total_price*1.1.round
      @order_item.save
    end
    @enduser.cart_items.destroy_all
    redirect_to enduser_orders_thanks_path
  end

  def confirm
    @order = Order.new(order_params)
    @enduser = current_enduser_enduser
    @shipping = current_enduser_enduser.shippings
    @cart_items = CartItem.all
    @total_price = 0
    @cart_items.each do |cart_item|
    @total_price += cart_item.sub_total_price
    end
    @price_include_tax = @total_price + 800

    if params[:order][:order] == '0'
      @order.postal_code = @enduser.postal_code
      @order.address = @enduser.address
      @order.name = @enduser.first_name + @enduser.last_name
    elsif params[:order][:order] == '1'
      @address = Shipping.find(params[:order][:id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    # elsif params[:order][:order] == '2'
    #   @address = Shipping.new
    #   @address.postal_code = params[:order][:postal_code]
    #   @address.address = params[:order][:address]
    #   @address.name = params[:order][:name]
    #   @address.save

    #   @order.postal_code = @address.postal_code
    #   @order.address = @address.address
    #   @order.name = @address.name
    end

  end

  def thanks
  end

  def index
    @enduser = current_enduser_enduser
    @orders = @enduser.orders.page(params[:page]).reverse_order
  end

  def show
    @enduser = current_enduser_enduser
    @orders = @enduser.orders.all
    @order = Order.find(params[:id])
    @shipping = current_enduser_enduser.shippings
    @delivery_fee = @order.price_include_tax - 800
  end

  private
   def order_params
   params.require(:order).permit(:enduser_id, :postal_code, :address, :name, :method_pay, :delivery_fee, :order_status, :price_include_tax)
   end

  # def current_enduser
  #   @enduser = Enduser.find(current_enduser_enduser.id)
  # end
end
