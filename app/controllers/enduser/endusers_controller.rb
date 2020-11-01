class Enduser::EndusersController < Enduser::Base
  def show
  end

  def edit
  end

  def update
  end

  def destroy
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

end
