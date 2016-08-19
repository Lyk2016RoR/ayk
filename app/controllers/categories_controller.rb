class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])

		if @category.update(strong_params)
			flash[:success] = "Kişi Başarıyla Güncellendi"
      redirect_to category_path(@category)
    else
      render :edit
    end
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(strong_params)

		if @category.save
			flash[:success] = "Yeni Kitap Oluşturuldu"
			redirect_to category_path(@category)
		else
			render :new
		end
	end

  def destroy
    @category = Category.find(params[:id])

    @category.destroy
    flash[:success] = "Kitap Başarıyla Silindi"
    redirect_to categories_path
  end

  private

  def strong_params
  	params.require(:category).permit(:name, :published_date, :page_number)
  end
end
