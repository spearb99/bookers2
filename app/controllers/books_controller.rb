class BooksController < ApplicationController
  def new
  end

  def index
    @user = current_user
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(current_user.id)
  end

  def show
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
