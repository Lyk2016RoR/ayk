class PublishersController < ApplicationController

  def new
    @publisher = Publisher.new

  end



  def index
    @publishers = Publisher.all

  end

  def show
    @publisher = Publisher.find(params[:id])
  end

  def create
    @publisher = Publisher.new(publisher_params)

    if @publisher.save
      flash[:success] = 'Isleminiz basariyla tamamlandi'
      redirect_to publisher_path(@publisher)
    else

      render :new
    end
  end

  def edit
    @publisher = Publisher.find(params[:id])

  end
  def update
    if @publisher.update(publisher_params)
      redirect_to publisher_path(@publisher)
    else

      render :edit
    end
  end

  def destroy
    @publisher.destroy
    redirect_to publisher_path, notice: "Published house was deleted"
  end

  def publisher_params
    params.require(:publisher).permit(:name)
  end

end
