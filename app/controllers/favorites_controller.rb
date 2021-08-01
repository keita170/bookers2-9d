class FavoritesController < ApplicationController


  def create
    @booki = Book.find(params[:book_id])
    @favorite = current_user.favorites.new(book_id: @booki.id)
    @favorite.save
    # @favorite = Favorite.create(user_id: current_user.id, book_id: @booki.id)
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @booki = Book.find(params[:book_id])
    @favorite = current_user.favorites.find_by(book_id: @booki.id)
    @favorite.destroy
    # redirect_back(fallback_location: root_path)
  end





end
