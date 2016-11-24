class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @new_comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)

    if @post.save
      flash[:success] = "Post updated successfully."
      redirect_to @post
    else
      flash[:error] = "Post has not been updated."
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,:text_body,:user_id)
  end

end
