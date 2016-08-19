class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @comment = Comment.new
    @favorite = Favorite.new
  end

  def edit
		@book = Book.find(params[:id])
    @categories = Category.all.collect {|c| [c.name, c.id]}
    @writers = Writer.all.collect {|w| [w.name, w.id]}
	end

	def update
		@book = Book.find(params[:id])

		if @book.update(strong_params)
			flash[:success] = "Kitap Başarıyla Güncellendi"
      redirect_to book_path(@book)
    else
      render :edit
    end
	end

	def new
		@book = Book.new
    @categories = Category.all.collect {|c| [c.name, c.id]}
    @writers = Writer.all.collect {|w| [w.name, w.id]}
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
  	params.require(:book).permit(:name, :published_date, :page_number, :category_id,
    :writer_id)
  end
end
