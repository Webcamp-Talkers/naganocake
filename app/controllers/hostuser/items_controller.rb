class Hostuser::ItemsController < Hostuser::Base
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # あとでジャンルidをここに必ず入れる
    if @item.save
      flash[:notice] = "update successfully"
      redirect_to hostuser_item_path(@item.id)
    else
      render "items/show"
    end
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
    params.require(:item).permit(:name, :price_before_tax, :image, :details, :sales_status)
  end

end
