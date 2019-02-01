class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # create user_category and mark as favorite
      favorite_category = Category.find_by_name(params[:user][:categories])
      user_category = UserCategory.create(user_id: @user.id, category_id: favorite_category.id)
      user_category.user_favorite = true
      #
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @messages = @user.define_error_messages
      render :new
    end
  end

  def show
    if params[:id].to_i == session[:user_id]
      @user = current_user
      @activity = Activity.new
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
    # remove logic?
    # if a new activity was provided
    if params.has_key?(:activities)
      @activity = Activity.new(title: params[:activities][:title])
      @activity.user_id = @user.id
      @activity.description = params[:activities][:description]
      @activity.due_date = params[:activities][:due_date]

      if @activity.save
        redirect_to user_path(@user)
      else
        @messages = @activity.define_error_messages
        render :show
      end
    # if updating user account info
    elsif @user.update(user_params)
      redirect_to user_path(@user)
    else
      @messages = @user.define_error_messages
      # lost current_user.name if render
      # lost errors if redirect
      render :edit
    end
  end

  def destroy
    if current_user?
      current_user.delete
      render '/welcome/home'
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :image, :about, :password, :password_confirmation,
                          activities: [:title, :description, :due_date, :user_id],
                          user_categories: [:user_favorite])
  end
end
