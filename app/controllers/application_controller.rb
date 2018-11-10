class ApplicationController < ActionController::Base
  # protect_from_forgery unless oauth is taking care of it
  protect_from_forgery unless: -> { @auth }

  helper :activities
  # SESSIONS
  def auth
    @auth = request.env['omniauth.auth']
  end

  def logged_in?
     !!current_user
  end

  def email_login
    # error if existing email belongs to facebook user and then a password is entered - password digest is nil for that user in the db
    # if user instance found via email
    if @user = User.find_by(email: params[:user][:email])
      # check if @user has password digest
      # if user has password digest
      if !@user.password_digest.nil?
        # authenticate the password
        if @user.try(:authenticate, params[:user][:password])
          # if password match
          session[:user_id] = @user.id

          redirect_to user_path(@user)
        else
          redirect_to '/login', notice: "You must enter a valid email and password"
        end
      # if user does not have password digest *means they are in the db having already used facebook to log in
      else
        redirect_to '/login', notice: "Please login via facebook, or create a new account"
      end
    else
      # if user instance NOT found via email
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
