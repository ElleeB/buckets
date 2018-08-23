class SessionsController < ApplicationController

  def new
  end

  def create
    ##=> try using ar validations and callbacks here
    if user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
      session[:user_id] = user.id

      redirect_to user_path(user)
    else
      redirect_to '/login', notice: "You must enter a valid email and password"
    end
  end

  private

end
