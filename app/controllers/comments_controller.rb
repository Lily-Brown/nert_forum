class CommentsController < ApplicationController
  before_action :verify_logged_in
  before_action :get_comment, only: [:show, :edit, :update, :destroy]
  before_action :verify_user, only: [:edit, :update, :destroy]

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

  def destroy
    if @comment.destroy
      flash[:success] = "Comment deleted successfully."
      redirect_to post_path(@comment.post)
    else
      flash[:error] = "Comment has not been deleted."
      redirect_to post_path(@comment.post)
    end
  end

  private

  def get_comment
    @comment = Comment.find(params[:id])
  end

  def verify_logged_in
    unless user_signed_in?
      flash[:error] = 'You must be logged in.'
      redirect_to new_user_session_path
    end
  end

  def verify_user
    unless @comment.owner == current_user
      flash[:error] = 'You are not authorized to perform this action.'
      redirect_to :back
    end
  end

  def comment_params
    params.require(:comment).permit(:text_body,:post_id)
  end
end
