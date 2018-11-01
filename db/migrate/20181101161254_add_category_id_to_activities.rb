class AddCategoryIdToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :category_id, :integer
  end
end
