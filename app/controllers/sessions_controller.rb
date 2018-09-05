class SessionsController < ApplicationController

  def new
  end

  def create
    # if used email and password to log in
    if params[:email].present?
      if @user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
        session[:user_id] = user.id

        redirect_to user_path(@user)
      else
        ##=> try using ar validations and callbacks here
        redirect_to '/login', notice: "You must enter a valid email and password"
      end
    # if used Facebook to log in
    else
      if @user = User.find_by(uid: auth['uid'])

        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        @user = User.create(
          uid: auth['uid'],
          name: auth['info']['name'],
          email: auth['info']['email'],
          image: auth['info']['image'],
        )
        @user.save(validate: false)

        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    end
  end

  def destroy
    session.destroy

    redirect_to '/'
  end
end
