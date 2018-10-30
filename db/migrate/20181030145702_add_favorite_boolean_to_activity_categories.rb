class AddFavoriteBooleanToActivityCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :activity_categories, :favorite, :boolean, default: false

  end
end
