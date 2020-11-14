class Hostuser::ItemsController < Hostuser::Base
  before_action :authenticate_hostuser_hostuser!
  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品の登録が出来ました"
      redirect_to hostuser_item_path(@item.id)
    else
      @genres = Genre.all
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @price_includ_tax = (@item.price_before_tax*1.1).floor
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      flash[:notice] = "商品情報を更新しました"
      redirect_to hostuser_item_path(@item.id)
    else
      @genres = Genre.all
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price_before_tax, :image, :details, :sales_status,:genre_id)
  end


end
