class SessionsController < ApplicationController

  def new
  end

  def create
    # log in user with the correct password

    # if user has entered login info
      # check the login info (name + password) against database
       # if match
        # create session and redirect_to user_path
      # else
        # redirect_to /login
        # flash[:notice]
      # end
    # elsif not entered login info
      # redirect_to /login
      # flash[:notice]
    # end


    redirect_to user_path
  end
end
