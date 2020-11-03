class Hostuser::HostusersController < Hostuser::Base
  def index
    @endusers = Enduser.all
  end

  def show
    @enduser = Enduser.find(params[:id])
  end

  def edit
    @enduser = Enduser.find(params[:id])
  end

  def update
    @enduser = Enduser.find(params[:id])
    if @enduser.update(enduser_params)
      flash[:update] = "You have updated enduser successfully."
      redirect_to hostuser_path(@enduser)
    else
      render 'index'
    end
  end

  private
    def enduser_params
      params.require(:enduser).permit(:first_name, :last_name, :first_furigana, :last_furigana, :phone_number, :postal_code, :address, :costomer_status)
    end
end
