class CommentsController < ApplicationController
  def create
    respond_to do |format|
      @comment = current_user.comments.build(comment_params)
      @comment.post_id = params[:post_id]
      @comment.save
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end