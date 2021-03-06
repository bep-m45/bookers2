class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
   @books = Book.all
   @user = current_user
   @book = Book.new
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id

       if @book.save
          flash[:notice] = "Book was successfully created."
          redirect_to book_path(@book.id)
       else
          @books = Book.all
           render 'index'
       end
  end


  def show
  @book = Book.find(params[:id])
  @user = @book.user
  @books = @user.books
  @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id  
    redirect_to books_path
    end
  end

  def update

     @book = Book.find(params[:id])
     if @book.update(book_params)
        flash[:notice] ='You have updated book successfully.'
        redirect_to @book
     else
        render 'edit'
     end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
