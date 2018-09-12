class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :list_id
      t.integer :user_id
      t.integer :activity_id
      t.boolean :complete, default: false
    end
  end
end
