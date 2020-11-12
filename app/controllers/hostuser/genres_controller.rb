class Hostuser::GenresController < Hostuser::Base

  def index
    @genre = Genre.new
    @genres = Genre.all.page(params[:page]).per(10)
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルを追加しました"
      redirect_to hostuser_genres_path
    else
      @genres = Genre.all.page(params[:page]).per(10)
      flash.now[:alert] = '入力に不備があります'
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
        flash[:notice] = "ジャンルを変更しました"
        redirect_to hostuser_genres_path
    else
      render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :valid_flag)
  end

end

