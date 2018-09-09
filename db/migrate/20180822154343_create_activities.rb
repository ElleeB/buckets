class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.string :due_date
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
