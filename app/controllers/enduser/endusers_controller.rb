class Enduser::EndusersController < Enduser::Base
  before_action :current_enduser_aaa
  def show
  end

  def edit
  end

  def update
    @endusers = current_enduser_enduser.id
    if @endusers.update(enduser_params)
      redirect_to endusers_path, notice: "更新に成功しました"
    else
      flash.now[:alert] = '入力に不備があります'
      render 'enduser/endusers/edit'
    end
  end

  def leaving
  end

  def leaving_out
    @endusers.costomer_status = false
    @endusers.save
    redirect_to root_path
  end

  private
  def enduser_params
    params.require(:enduser).permit(:email, :first_name, :last_name, :first_furigana, :last_furigana, :phone_number, :postal_code, :address, :costomer_status)
  end

  def current_enduser_aaa
    @endusers = current_enduser_enduser
  end

end