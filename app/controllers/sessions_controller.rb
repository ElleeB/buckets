class SessionsController < ApplicationController

  def new
  end

  def create
    # if used email and password to log in
    if !params[:user].nil?
      email_login
      
    # if used Facebook to log in
    else
      if @user = User.find_by(uid: auth['uid'])
        existing_user_facebook_login
      else
        new_user_facebook_login
      end
    end
  end

  def destroy
    session.destroy

    redirect_to '/'
  end
end
