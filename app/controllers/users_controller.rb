class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:@user_id] = @user.id

      redirect_to user_path(@user)
    else
      @messages = @user.errors.each do |msg|
        msg
      end
      render :new
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
    ## Need to lock this down so no one other than logged in can access
    @user = current_user
    if @user.update(user_params)

      redirect_to user_path(@user)
    else
      # raise @user.inspect => includes invalid attributes! Ex. name: ""
      # this is a problem because the form field placeholder text is incorrect
      # not persisted though
      @messages = @user.errors.each do |msg|
        msg
      end
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :image, :about, :password, :password_confirmation)
  end
end
