class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
  end
  def new
    @favorites = Favorite.new
  end
  def create

    #Okundu olarak işaretle
    @favorite = Favorite.new(book_id: params[:format],user_id: current_user.id)

    if @favorite.save
      flash[:success] = "Başarıyla Eklendi"
      redirect_to favorites_path
    else
      render :show
    end
  end
  def destroy
    @favorite = Favorite.find(params[:id])

    @favorite.destroy
    flash[:success] = "Bu kitap okunmadı olarak işaretlendi"
    redirect_to favorites_path
  end

end
