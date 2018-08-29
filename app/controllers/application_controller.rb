class ApplicationController < ActionController::Base
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
