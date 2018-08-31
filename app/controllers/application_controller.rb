class ApplicationController < ActionController::Base
  protect_from_forgery with :exception

  def auth
    @auth = request.env['omniauth.auth']
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
     !!session[:user_id]
   end

  def current_bucket_item
    @bucket_item = BucketItem.find(params[:id])
  end
end
