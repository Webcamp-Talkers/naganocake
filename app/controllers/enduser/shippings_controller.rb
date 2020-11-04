class Enduser::ShippingsController < Enduser::Base
  before_action :shipping_find, only: [:edit, :update, :destroy]
  
  def index
    @shippings = Shipping.all
    @shipping = Shipping.new
  end

  def create
    @shipping = Shipping.new(shipping_params)
    @shipping.enduser_id = current_enduser_enduser.id
    if @shipping.save
      redirect_to enduser_shippings_path, notice: "配送先を登録しました"
    else
      flash.now[:alert] = '入力に不備があります'
      render 'enduser/shippings/index'
    end
  end

  def edit
  end

  def update
    if @shipping.update(shipping_params)
      redirect_to enduser_shippings_path, notice: "編集に成功しました"
    else
      flash.now[:alert] = '入力に不備があります'
      render 'enduser/shippings/edit'
    end
  end

  def destroy
    if @shipping.destroy
      redirect_to enduser_shippings_path, notice: "配送先を登録しました"
    else
      flash.now[:alert] = '削除に失敗しました'
      render 'enduser/shippings/index'
    end
  end
  
  private
  
  def shipping_params
    params.require(:shipping).permit(:postal_code, :address, :name)
  end
  
  def shipping_find
    @shipping = Shipping.find(params[:id])
  end

end
