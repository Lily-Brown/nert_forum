class PostsController < ApplicationController
  before_action :get_post, only: [:show, :edit, :update, :destroy]
  before_action :verify_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @new_comment = Comment.new
  end

  def edit
  end

  def update
    @post.update_attributes(post_params)

    if @post.save
      flash[:success] = "Post updated successfully."
      redirect_to @post
    else
      flash[:error] = "Post has not been updated."
      render :edit
    end
  end

  def destroy

    if @post.destroy
      flash[:success] = "Post deleted successfully."
      redirect_to posts_path
    else
      flash[:error] = "Post has not been deleted."
      redirect_to @post
    end
  end

  private

  def get_post
    @post = Post.find(params[:id])
  end

  def verify_user
    unless @post.owner == current_user
      flash[:error] = 'You are not authorized to perform this action.'
      redirect_to :back
    end
  end

  def post_params
    params.require(:post).permit(:title,:text_body,:user_id)
  end

end
