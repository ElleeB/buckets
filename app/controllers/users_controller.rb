class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # figure out how to use validation error messages here
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id

      redirect_to user_path(user)
    else
      flash[:notice] = "Please enter valid information in each of the fields below"
      redirect_to new_user_path
    end
  end

  def show
    if params[:id].to_i == session[:user_id]
      @user = current_user
    else
      redirect_to '/'
    end
  end

  def account
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    # binding.pry
    @user = current_user.update(user_params)

    # @user.errors
    # => @details={:password=>[{:error=>:too_short, :count=>6}]},
    # => @messages={:password=>["is too short (minimum is 6 characters)"]}>

    if @user.errors.any?

      redirect_to edit_user_path(@user)
    else

      redirect_to user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :image, :about, :password, :password_confirmation)
  end
end
