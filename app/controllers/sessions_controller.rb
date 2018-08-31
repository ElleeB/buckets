class SessionsController < ApplicationController

  def new
  end

  def create

    # if used Facebook to log in

    # if used email and password to log in

    if user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
      session[:user_id] = user.id

      redirect_to user_path(user)
    else
      ##=> try using ar validations and callbacks here
      redirect_to '/login', notice: "You must enter a valid email and password"
    end
  end

  def destroy
    session.destroy

    redirect_to '/'
  end

  private

end
