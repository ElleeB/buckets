module UsersHelper

  def favorite_category
    user_category = UserCategory.where(user_id: @user.id).to_a
    Category.find_by(id: user_category['category_id'.to_i]).name
  end
end
