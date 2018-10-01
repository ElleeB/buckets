class ApplicationController < ActionController::Base
  # protect_from_forgery unless oauth is taking care of it
  protect_from_forgery unless: -> { @auth }

  # SESSIONS
  def auth
    @auth = request.env['omniauth.auth']
  end

  def logged_in?
     !!session[:user_id]
  end

  def email_login
    if @user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      ##=> try using ar validations and callbacks here
      redirect_to '/login', notice: "You must enter a valid email and password"
    end
  end

  def existing_user_facebook_login
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def new_user_facebook_login
    @user = User.create(
      uid: auth['uid'],
      name: auth['info']['name'],
      username: auth['info']['name'],
      email: auth['info']['email'],
      image: auth['info']['image'],
    )
    @user.save(validate: false)

    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  # USERS
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def current_user?
    if current_user
      current_user.id == session[:user_id]
    else
      render '/welcome/home'
    end
  end

  def activity_user?
    activity = current_activity
    activity.user_id == current_user.id
  end

  def list_user?
    list = current_list
    list.activity.user_id == session[:user_id]
  end

  # ACTIVITIES
  def current_user_activities
    current_user.activities
  end

  def current_activity
    Activity.where(id: "#{params[:id]}").first
  end

  # LISTS
  def current_list
    List.where(id: "#{params[:id]}").first
  end
end
