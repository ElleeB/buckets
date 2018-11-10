class AdminController < ActionController::Base

  def most_activities
    @user = User.most_activities
  end

  def category_users
    @categories = Category.all
  end

  def order_by_name
    @categories = Category.order_by_name
  end
end
