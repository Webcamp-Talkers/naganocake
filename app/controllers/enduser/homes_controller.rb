class Enduser::HomesController < Enduser::Base

  def top
    @genres = Genre.all.order(create_at: :desc)
    @items = Item.all.order(create_at: :des)
  end

  def about
  end
end
