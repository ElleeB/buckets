class ApplicationController < ActionController::Base
  # protect_from_forgery unless oauth is taking care of it
  protect_from_forgery unless: -> { @auth }

  def auth
    @auth = request.env['omniauth.auth']
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
     !!session[:user_id]
   end

  # def current_activity
  #   if session[:activity_id]
  #     @activity = Activity.find(session[:activity_id])
  #   else
  #     @activity ||= Activity.find(params[:id])
  #   end
  # end
end
