class Enduser::CartItemsController < Enduser::Base
  
  def index
    @items = Item.all
    @cart_items = CartItem.all
    @cart_item = CartItem.where(enduser_id: current_enduser_enduser.id)
    @total_price = CartItem.total_price
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.end_user_id = current_end_user.id
    @cart_item.item_id = 
    
    if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
     
     current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).number += params[:cart_item][:number].to_i
     current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).save
     flash[:notice] = "Item was successfully added to cart."
     redirect_to cart_items_path
    elsif @cart_item.save
     flash[:notice] = "New Item was successfully added to cart."
     redirect_to cart_items_path
    else
     render 'end_users/items/show'
    end
    
  end

  def update
  end

  def destroy
  end

  def all_destroy
    @cart_item = CartItem.where(enduser_id: current_enduser_enduser.id)
    @cart_item.clear
  end
  
  private
  def cart_params
    params.require(:cart_item).permit(:quantity)
  end
  
end
