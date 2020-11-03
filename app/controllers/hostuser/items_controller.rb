class Hostuser::ItemsController < Hostuser::Base
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  end
  
   private
  def item_params
    params.require(:item).permit(:names, :price_before_tax, :image_id, :details)
  end

end
