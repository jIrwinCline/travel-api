class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    # @user_id = current_user.id
    render :new
  end

  def create
    # user_params[:user_id] = current_user.id
    @user = User.new(sign_up_params)
    # @user.user_id = current_user.id
    if @user.save
      flash[:notice] = "User successfully posted!"
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    flash[:notice] = "User successfully edited!"
    render :edit
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def update
    @user= User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User successfully updated!"
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User successfully destroyed!"
    redirect_to users_path
  end

  private
  def sign_up_params
   params.require(:user).permit(:email, :password, :password_confirmation)
 end
end
