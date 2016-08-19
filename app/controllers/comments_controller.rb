class CommentsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_idea

  def create
    @comment = @book.comments.new(comment_params)
    #@comment.user = current_user
    if @comment.save
      redirect_to @book, notice: "Comment was saved"
    else
      redirect_to @book, notice: "Comment couldn't saved"
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_idea
    @book = Book.find(params[:book_id])
  end

end
