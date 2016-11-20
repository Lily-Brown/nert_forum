class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'Comment added.'
      redirect_to @comment.post
    else
      flash[:error] = @comment.errors.full_messages.join(' ')
      redirect_to @comment.post
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text_body,:post_id)
  end
end
