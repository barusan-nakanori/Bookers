class BooksController < ApplicationController
  def index
  	@books = Book.all.order(id: "ASC")
  end

  def new
  	@book = Book.new
  end

  def create
  	book = Book.find(params[:id])
  	book.save
  	redirect_to book_path
  end

  def show
  end

  def edit
  end

end
