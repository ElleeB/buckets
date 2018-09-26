class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.create(user_params)
      session[:user_id] = @user.id

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
      @user = User.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def account
    # make sure user is the owner of the account
    @user = current_user
  end

  def edit
    # make sure user is the owner of the account
    @user = current_user
  end

  def update
    # raise params.inspect
    # error: param is missing or the value is empty: user
    # Need to lock this down so no one other than logged in can access
    @user = current_user

    ###
    if params[:activities][:title]
      @activity = Activity.new(title: params[:activities][:title])
      @activity.user_id = @user.id
      @activity.description = params[:activities][:description]
      @activity.due_date = params[:activities][:due_date]

      if @activity.save

        redirect_to user_path(@user)
      else
        redirect_to user_path(@user)
      end
    ###

    elsif @user.update(user_params)

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
    params.require(:user).permit(:name, :username, :email, :image, :about, :password, :password_confirmation,
                          activities: [:title, :description, :due_date, :user_id])
  end
end
