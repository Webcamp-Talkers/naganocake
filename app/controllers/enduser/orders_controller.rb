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
    @enduser = current_enduser_enduser
    @items = @enduser.order_items
    return if @order
      render :new
  end

  def thanks
  end

  def index
    @orders = Order.all
  end

  def show
    @enduser = current_enduser_enduser
    @shipping = current_enduser_enduser.shippings
  end

  private
   def order_params
     @proposal = Proposal.new(params.require(:proposal).permit(:enduser_id, :postal_code, :address, :name, :method_pay, :delivery_fee, :order_status))
   end

  # def current_enduser
  #   @enduser = Enduser.find(current_enduser_enduser.id)
  # end
end
