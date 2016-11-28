class CommentsController < ApplicationController
  before_action :verify_logged_in
  before_action :get_comment, only: [:update, :destroy]
  before_action :verify_user, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'Comment added.'
      redirect_to @comment.parent
    else
      flash[:error] = @comment.errors.full_messages.join(' ')
      redirect_to @comment.parent
    end
  end

  def update
    if @comment.update_attributes(comment_params)
      flash[:success] = 'Comment updated.'
      redirect_to @comment.parent
    else
      flash[:error] = @comment.errors.full_messages.join(' ')
      redirect_to @comment.parent
    end
  end

  def destroy
    if @comment.destroy
      flash[:success] = "Comment deleted successfully."
      redirect_to @comment.parent
    else
      flash[:error] = "Comment has not been deleted."
      redirect_to @comment.parent
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
    unless params[:comment] && params[:comment][:flagged] || params[:action] != "destroy"
      unless @comment.owner == current_user || current_user.admin
        flash[:error] = 'You are not authorized to perform this action.'
        redirect_to :back
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:text_body,:flagged,:parent_id,:parent_type)
  end
end
