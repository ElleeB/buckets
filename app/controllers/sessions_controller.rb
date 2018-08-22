class SessionsController < ApplicationController

  def new
  end
  
  def create
    redirect_to user_path
  end
end
