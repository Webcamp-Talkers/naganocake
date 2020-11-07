class Enduser::CartItemsController < Enduser::Base
  
  def index
   @items = Item.all
   @cart_items = CartItem.all 
  end

  def create
   @item = Item.find(params[item_id])
   @cart_item = CartItem.new(cart_item_params)
   @cart_item.enduser_id = current_user.id
   @cart_item.item_id = @item.id
   @cart_item.save
   flash[:notice] = "カートに商品を追加しました"
   redirect_to enduser_crat_items_path
  end

  def update
  end

  def destroy
  end

  def all_destroy
  end
  
  private
  def cart_params
    params.require(:cart_item).permit(:quantity)
  end
  
end
