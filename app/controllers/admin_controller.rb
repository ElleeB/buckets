class AdminController < ActionController::Base

  def most_activities
    @user = User.most_activities
  end
end
