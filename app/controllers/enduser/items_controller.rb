class Enduser::ItemsController < Enduser::Base
  before_action :authenticate_enduser_enduser!, only: [:show]

  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @price_includ_tax = (@item.price_before_tax*1.1).floor
    @cart_item = CartItem.new
  end
  

end