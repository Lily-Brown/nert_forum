class PostsController < ApplicationController
  before_action :verify_logged_in, except: [:index,:show]
  before_action :get_post, only: [:show, :edit, :update, :destroy]
  before_action :verify_user, only: [:create, :edit, :update, :destroy]

  def index
    @posts = Post.all.reverse_order
    @new_post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash[:success] = "Post added."
      redirect_to posts_path
    else
      flash[:error] = "Post has not been added."
      render posts_path
    end
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

  def verify_logged_in
    unless user_signed_in?
      flash[:error] = 'You must be logged in.'
      redirect_to new_user_session_path
    end
  end

  def verify_user
    unless @post.owner == current_user || current_user.admin
      flash[:error] = 'You are not authorized to perform this action.'
      redirect_to :back
    end
  end

  def post_params
    params.require(:post).permit(:title,:text_body,:user_id)
  end

end
