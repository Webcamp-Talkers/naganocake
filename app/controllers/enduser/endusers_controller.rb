class Enduser::EndusersController < Enduser::Base
  before_action :current_enduser_aaa, only: [:show, :edit, :update, :leaving, :leaving_out]
  
  def show
  end

  def edit
  end

  def update
    if @enduser.update(enduser_params)
      redirect_to enduser_parh(@enduser)
    else
      flash.now[:alert] = '入力に不備があります'
      render 'endusers/edit'
    end
  end

  def leaving
  end

  def leaving_out
  end

  private
  def enduser_params
    params.require(:enduser).permit(:name, :first_name, :last_name, :first_furigana, :last_furigana, :phone_number,
    :postal_code, :address, :costomer_status)
  end
  
  def current_enduser_aaa
    @enduser = current_enduser_enduser
  end

end
