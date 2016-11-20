class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Changes saved successful'
      redirect_to @user
    else
      flash[:error] = @user.error.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
  end

  private 

  def user_params
    params.require(:user).permit(:name,:image,:neighborhood)
  end
end
