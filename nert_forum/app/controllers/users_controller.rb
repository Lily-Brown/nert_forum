class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update, :destroy]
  before_action :verify_user, only: [:edit, :update, :destroy]

  def index
  end

  def show
  end

  def new # TODO: Remove #new and #create 
  end

  def create
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Changes saved successfully.'
      redirect_to @user
    else
      flash[:error] = @user.error.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = 'User deleted successfully.'
      redirect_to root_path
    else
      flash[:error] = @user.error.full_messages.join(' ')
      render :show
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name,:image,:neighborhood)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def verify_user
    unless @user == current_user
      flash[:error] = 'You are not authorized to perform this action.'
      redirect_to :back
    end
  end
end
