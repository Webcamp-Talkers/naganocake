class Hostuser::HostuserHomesController < Hostuser::Base
  def top
    @orders = Order.all
  end
end
