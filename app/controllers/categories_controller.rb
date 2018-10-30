class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @user = current_user
  end
end
