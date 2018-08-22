class SessionsController < ApplicationController

  def new
  end

  def create
    # log in user with the correct password
    # if user has entered login info
    # if params[:email] && params[:password]
      # check the login info (name + password) against database
    if user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
      # if match
        # create session and redirect_to user_path
      session[:user_id] = user.id

      redirect_to user_path(user)
    else
      # redirect_to /login
      # flash[:notice]
      redirect_to '/login', notice: "You must enter a valid email and password"
    end
    # elsif not entered login info
    # else
    #   redirect_to '/login', notice: "You must enter a valid email and password"
    # end
  end

  private

end
