class CommentsController < ApplicationController

    before_action :set_book
    before_action :set_comment, only: [:destroy]
    before_action :authorize_user!, only: [:destroy]

    def create
      @comment = Comment.new(body: params[:comment][:body],book_id: params[:book_id],user_id: current_user.id)

      if @comment.save
        flash[:success] = "Başarıyla Eklendi"
        redirect_to book_path(@comment.book)
      else
        render :show
      end
    end
    def strong_params
  		params.permit(:body, :book_id)
  	end

    def destroy
      @comment.destroy
      redirect_to @book, notice: "Yorum Silindi"
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def authorize_user!
      redirect_to @book, notice: "Yetkin yok" unless @comment.user_id == current_user.id
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_book
      @book = Book.find(params[:book_id])
    end
end
