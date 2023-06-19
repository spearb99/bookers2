class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "Has been successfully"
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "Up date successfully"
    redirect_to book_path(book.id)
  unless
    redirect_to edit_book_path(book.id)
  end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to  '/books'
  end


  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end
