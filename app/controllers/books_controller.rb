class BooksController < ApplicationController
  def new
  end

  def index
  	  @book = Book.new
  	  @books = Book.all
  end

  def show
	  @book = Book.find(params[:id])
  end

  def create
      @books = Book.all
      @book = Book.new
      @book = Book.new(book_params)
      if @book.save
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(@book)
      else
        flash[:error_messages] = @book.errors.full_messages
        render :index
      end
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
  	  @book = Book.find(params[:id])
      if @book.update(book_params)
         flash[:notice] = "Book was successfully updated."
  	     redirect_to book_path(@book)
      else
         flash[:error_messages] = @book.errors.full_messages
         render :edit
      end


  end

  def destroy
  	  book = Book.find(params[:id])
  	  book.destroy
  	  redirect_to books_path
  end

  private
  def book_params
  	  params.require(:book).permit(:title,:body)
  end
end
