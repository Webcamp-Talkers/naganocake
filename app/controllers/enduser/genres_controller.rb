class Enduser::GenresController < Enduser::Base

  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end

end

