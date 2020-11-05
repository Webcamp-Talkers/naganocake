class Enduser::ItemsController < Enduser::Base
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @price_includ_tax = (@item.price_before_tax*1.1).floor
  end
end
