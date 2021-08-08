class BooksController < ApplicationController
  

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      flash[:notice]= 'Book was successfully updated.was successfully updated.'
    redirect_to book_path(@book)
    else
    @books = Book.all
      render 'edit'
    end
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      flash[:notice]= 'Book was successfully updated.was successfully updated.'
      redirect_to book_path(@book)
    else
    @books = Book.all
      render 'index'
    end
  end

  def destroy
    books = Book.find(params[:id])
    books.destroy
    redirect_to books_path(books.id)
  end


  private
  def books_params
  params.require(:book).permit(:title, :body)
  end

end