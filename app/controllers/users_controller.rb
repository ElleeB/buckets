class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    if @user = User.create(user_params)

      render 'show'
    else
      redirect_to new_user_path
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
