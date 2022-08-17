class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book2 = Book.new(book_params)
    if @book2.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book2)
    else
      @book = Book.new
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @book = Book.new
    @book2 = Book.new
    @books = Book.all
    @user = current_user

  end

  def show
    @book1 = Book.new
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body).merge(user_id: current_user.id)
  end

end
