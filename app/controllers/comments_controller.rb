class CommentsController < ApplicationController
  def create

    @booki = Book.find(params[:book_id])
    comment = current_user.comments.new(comment_params)
    comment.book_id = @booki.id
    comment.save
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @booki = Book.find(params[:book_id])
    comment = Comment.find(params[:id])
     #comment = current_user.comments.find_by(id: @booki.id)
   
    comment.destroy
    # redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
