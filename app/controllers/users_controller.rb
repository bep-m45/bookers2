class UsersController < ApplicationController
  def index
  end

  def show
  @user = User.find(params[:id])
  @book = Book.new
  @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user_image = UserImage.new(user_image_params)
    @user_image.user.id = current_user.id
    redirect_to @book
  end

  def update
    @user = User.find(params[:id])
    if @user.save
       flash[:noatice] = 'You have updated user successfully.'
       redirect_to user_path(@user.id)
    else
       redirect_to 'edit'
    end
  end

  private

  def user_params
  params.require(:user).permit(:name, :email, :pass, :image)
  end
end

