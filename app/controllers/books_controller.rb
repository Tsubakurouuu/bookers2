class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update
      flash[:notice] = "You have updated book successfully."
      redirect_to books_path(@book)
    else
      render :edit
    end
    
    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
    end
  end

  private

  def book_params
    params.permit(:title, :opinion)
  end


end
