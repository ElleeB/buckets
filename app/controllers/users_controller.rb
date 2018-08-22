class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    redirect_to user_path
  end

  def show
  end
end
