class Enduser::OrdersController < Enduser::Base
  def new
    @order = Order.new
  end

  def create
    @order = Order(params[:id])
  end

  def confirm
    return if @order.vaild?
    render 'confirm'
  end

  def thanks
  end

  def index
  end

  def show
  end
end
