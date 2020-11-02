class Hostuser::HostusersController < Hostuser::Base
  def index
    @endusers = Enduser.all
  end

  def show
    @enduser = Enduser.find(params[:id])
  end

  def edit
  end
  
  def update
  end
  
end
