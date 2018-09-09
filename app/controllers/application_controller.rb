class ApplicationController < ActionController::Base
  # protect_from_forgery unless oauth is taking care of it
  protect_from_forgery unless: -> { @auth }

  def auth
    @auth = request.env['omniauth.auth']
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
     !!session[:user_id]
   end

  def current_activity
    @activity = Activity.find(params[:id])
  end
end
