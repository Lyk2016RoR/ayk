class BooksController < ApplicationController
  has_many :comments
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])

		if @book.update(strong_params)
			flash[:success] = "Kişi Başarıyla Güncellendi"
      redirect_to book_path(@book)
    else
      render :edit
    end
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(strong_params)

		if @book.save
			flash[:success] = "Yeni Kitap Oluşturuldu"
			redirect_to book_path(@book)
		else
			render :new
		end
	end

  def destroy
    @book = Book.find(params[:id])

    @book.destroy
    flash[:success] = "Kitap Başarıyla Silindi"
    redirect_to books_path
  end

  private
  def strong_params
  	params.require(:book).permit(:name, :published_date, :page_number)
  end
end
