class BooksController < ApplicationController
  def index
  	@books = Book.all.order(id: "ASC")
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)
  	book.save
  	redirect_to book_path
  end

  def show
  end

  def edit
  end

private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
