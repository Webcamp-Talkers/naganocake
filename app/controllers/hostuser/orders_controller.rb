class Hostuser::OrdersController < Hostuser::Base

  def index
    @endusers = Enduser.all
    @enduser = current_enduser_enduser
    @orders = Order.page(params[:page]).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @order_item = OrderItem.where(order_id: @order)
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == "入金確認"
      @order.order_items.update(make_status: "製作待ち")
    end

    flash[:notice] = "注文ステータスを更新しました"
    redirect_to hostuser_order_path(@order)
  end

  private
	def order_params
		  params.require(:order).permit(:order_status, order_item:[:id, :make_status])
	end


end
