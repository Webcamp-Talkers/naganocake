class Enduser::OrdersController < Enduser::Base
  def new
    @order = Order.new
    @enduser = current_enduser_enduser
    @shipping = current_enduser_enduser.shippings
  end

  def create
    @order = Order.find(params[:id])
    @order.save
    redirect_to enduser_orders_thanks_path
  end

  def confirm
    return if @order
      render :confirm
    @enduser = current_enduser_enduser
    @order = Order.new
    # @order_items = current_enduser_enduser.order_items
    @order.method_pay = params[:order][:method_pay]
    # if params[:order][:address_option]  == "ご自身の住所"
    #   @order.pastal_code = current_enduser_enduser.postal_code
    #   @order.address = current_enduser_enduser.address
    # elsif params[:order][:address_option] == "発送済みの住所"
    #   @sta = params[:order][:order_adderss].to_i

    # else

    # end
  end

  def thanks
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.all
    @enduser = current_enduser_enduser
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
