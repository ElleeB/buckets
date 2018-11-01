class CreateUserCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :user_categories do |t|
      t.integer :user_id
      t.integer :category_id
      t.boolean :user_favorite, default: false

      t.timestamps
    end
  end
end
