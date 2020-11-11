class Enduser::HomesController < Enduser::Base

  def top
    @genres = Genre.all.order(create_at: :desc)
    @items = Item.where(sales_status: "販売中").last(4)
  end

  def about
  end
end
