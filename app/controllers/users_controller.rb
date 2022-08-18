class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.sign_up
      flash[:notice] = 'Welcome! You have signed up successfully.'
      redirect_to user_path(current_user.id)
    end

    if @user.sign_in
      flash[:notice] = 'Signed in successfully.'
      redirect_to user_path(current_user.id)
    end

    if @user.sign_out
      flash[:notice] = 'Signed out successfully.'
      redirect_to "/"
    end
  end

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
