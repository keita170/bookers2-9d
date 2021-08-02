class HomesController < ApplicationController
  def top
  end

  def about
  end

  def search
    @user = current_user
    @book = Book.new
    @books = Book.search(params[:keyword])
  end
end
