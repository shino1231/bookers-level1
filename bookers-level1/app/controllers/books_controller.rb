class BooksController < ApplicationController
  
  def new
    @book = Book.new
    @books = Book.all
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path(book.id)
  end

  def index
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end
  
  def show
    @book = Book.find(params[:id])  
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end

end