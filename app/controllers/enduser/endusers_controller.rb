class Enduser::EndusersController < Enduser::Base
  before_action :current_enduser_aaa, only: [:show, :edit, :update, :leaving, :leaving_out]
  before_action :authenticate_enduser_enduser!, only: [:show, :edit, :update, :leaving, :leaving_out]
  def show
  end

  def edit
  end

  def update
    if @enduser.update(enduser_params)
      redirect_to endusers_path, notice: "更新に成功しました"
    else
      flash.now[:alert] = '入力に不備があります'
      render 'enduser/endusers/edit'
    end
  end

  def leaving
  end

  def leaving_out
    @enduser.update(costomer_status: false)
    reset_session
    redirect_to root_path
  end

  private
  def enduser_params
    params.require(:enduser).permit(:first_name, :last_name, :first_furigana, :last_furigana, :email, :phone_number, :postal_code, :address, :costomer_status)
  end


  def current_enduser_aaa
    @enduser = Enduser.find(current_enduser_enduser.id)
  end

end