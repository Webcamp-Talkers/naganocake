class Enduser::CartItemsController < Enduser::Base

  def index
    @cart_items = CartItem.all
    @total_price = 0
    @cart_items.each do |cart_item|
     @total_price += cart_item.sub_total_price
    end
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.enduser_id = current_enduser_enduser.id
    # もし、カートアイテムの中にすでに同じ商品があった場合
    if current_enduser_enduser.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
     @cart_item = current_enduser_enduser.cart_items.find_by(item_id: params[:cart_item][:item_id])
     @cart_item.quantity += params[:cart_item][:quantity].to_i
     @cart_item.save
     flash[:notice] = "カートの中身を更新しました"
     redirect_to enduser_cart_items_path
     #カートアイテムの中に同じ商品はまだない場合
    elsif current_enduser_enduser.cart_items.find_by(item_id: params[:cart_item][:item_id]).nil?
     @cart_item.save
     flash[:notice] = "カートに新しい商品を追加しました"
     redirect_to enduser_cart_items_path
     #上記いずれにも当てはまらないエラーの場合
    else
     @genres = Genre.all
     @item = Item.find_by(id: params[:id])
     render 'enduser/items/show'
    # redirect_to enduser_cart_items_path
    end

  end

  def update
    @cart_item = CartItem.find(params[:id])  
    
    if @cart_item.update(cart_item_params)
      flash[:notice] = "カートの中身を更新しました"
      redirect_back(fallback_location: @cart_item)
    else
      flash[:notice] = "カートの更新に失敗しました"
      render　"enduser/cart_items/index"
    end
    
  end

  def destroy
   cart_item = CartItem.find_by(id: params[:id])
   cart_item.destroy
   flash[:notice] = "選択した商品を削除しました"
   redirect_back(fallback_location: cart_item)
  end

  def all_destroy
    @cart_items = CartItem.all
    @cart_items.destroy_all
    flash[:notice] = "カートの中身を空にしました"
    redirect_back(fallback_location: enduser_cart_items_path)
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end

end
