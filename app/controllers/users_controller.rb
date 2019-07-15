class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @favorites = current_user.favorites.all
    unless current_user_page?
      redirect_to user_path(id: current_user.id)
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
end

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to @user, notice: '更新しました'
  else
    render 'edit'
  end
end

  private

  def user_params
    params.require(:user).permit(:name, :email, :user_image, :password, :password_confirmation)
  end
end
