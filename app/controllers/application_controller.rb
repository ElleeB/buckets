class ApplicationController < ActionController::Base
  # protect_from_forgery unless oauth is taking care of it
  protect_from_forgery unless: -> { @auth }

  def auth
    @auth = request.env['omniauth.auth']
  end

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

  def current_user_activities
    current_user.activities#.all
  end

  def current_activity
    # Activity.find(params[:id])
    Activity.where(id: "#{params[:id]}").first
  end

  def activity_user?
    activity = current_activity
    activity.user_id == current_user.id
  end

  def list_user?
    list = current_list
    list.activity.user_id == session[:user_id]
  end

  def current_list
    # List.find(params[:id])
    List.where(id: "#{params[:id]}").first
  end

  def logged_in?
     !!session[:user_id]
  end
end
