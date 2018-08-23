class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    if user = User.create(user_params)
      session[:user_id] = user.id

      redirect_to user_path(user)
    else
      redirect_to new_user_path
    end
  end

  def show
    # clean this up
    if @user = User.find_by(id: session[:id])
      nil
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
