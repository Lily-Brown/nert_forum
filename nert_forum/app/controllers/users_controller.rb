class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :get_user, only: [:show, :edit, :update, :destroy]
  before_action :verify_user, only: [:edit, :update]
  before_action :verify_admin, only: [:new, :create, :index, :destroy]

  def index
    @users = User.all
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
      redirect_to users_path
    else
      flash[:error] = @user.error.full_messages.join(' ')
      render users_path
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name,:photo,:neighborhood)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def verify_user
    unless @user === current_user
      flash[:error] = 'You are not authorized to perform this action.'
      redirect_to root_path
    end
  end

  def verify_admin
    unless current_user && current_user.admin
      flash[:error] = 'You must be an adminstrator to perform this action.'
      redirect_to root_path
    end
  end

end
