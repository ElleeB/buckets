class ApplicationController < ActionController::Base
  # protect_from_forgery unless oauth is taking care of it
  protect_from_forgery unless: -> { @auth }

  def auth
    @auth = request.env['omniauth.auth']
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def activity_user?
    activity = Activity.find(params[:id])
    activity.user_id == current_user.id
  end

  def current_user_activities
    current_user.activities.all
  end

  def logged_in?
     !!session[:user_id]
  end
end
