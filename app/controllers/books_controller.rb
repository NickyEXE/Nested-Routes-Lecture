class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_author

  def index
    if @author
      @books = @author.books
    else
      @books = Book.all
    end
  end

  def show

  end

  def new
    @book = Book.new
  end

  def create
    if @author
      @book = @author.books.create(book_params)
    else
      @book = Book.create(book_params)
    end
    if @book.valid?
      redirect_to author_book_path(@book.author, @book)
    else
      render 'new'
    end
  end

  def edit
    @edit = true

  end

  def update
    if @book.update(book_params)
      redirect_to author_book_path(@book.author, @book)
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to author_books_path(@author)
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def set_author
    @author = Author.find_by_id(params[:author_id])
  end

  def book_params
    params.require(:book).permit(:title, :genre, :year_published, :author_id)
  end

end
