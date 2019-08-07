class BooksController < ApplicationController
 add_flash_types :success, :info, :warning, :danger
  def show
    @post=Book.find(params[:id])
  end

  def index
 @post=Book.new
 @posts=Book.all
  end
  
def create
 @post = Book.new(post_params)
 if @post.save
      flash[:notice] = "YOU MADE NEW BOOK successfully!!"
      redirect_to book_path(@post.id) and return
 else
      @posts=Book.all
      render "index" and return
 end
end

  def new
    
  end
  
def update
    post = Book.find(params[:id])
    if post.update(post_params)
      flash[:notice] = "更新 successfully!!"
      redirect_to :action => 'show' and return
    else
      render "index" and return
    end
end
 
  def edit
    @post=Book.find(params[:id])
  end
  def destroy
    @post = Book.find(params[:id])
    @post.destroy
  redirect_to books_path
   
  end
  
   private
  def post_params
      params.require(:book).permit(:title, :body)
  end
  
end
