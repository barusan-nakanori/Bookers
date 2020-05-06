class BooksController < ApplicationController
  def index
    @book = Book.new
  	@books = Book.all.order(id: "ASC")
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
      flash[:success]= "Book was successfully created."
    	redirect_to book_path(@book.id)
	  else
		  render'books/index'
	  end
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
    	if @book.update(book_params)
        flash[:success]= "Book was successfully created."
    	  redirect_to book_path(@book.id)
      else
        render'books/edit'
      end

  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
