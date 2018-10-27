module CategoriesHelper

  def current_user_categories
    @current_user.categories
  end

  def user_category_activities(category)
    current_user_categories.find do |user_category|
      user_category.id == category.id
    end
  end


end
