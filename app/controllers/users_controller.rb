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
    @user = current_user
    if @user.update(user_params)

      redirect_to user_path(@user)
    else
      # raise @user.inspect => includes invalid attributes! Ex. name: ""
      # this is a problem because the form field placeholder text is incorrect
      # not persisted though
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :image, :about, :password, :password_confirmation)
  end
end
