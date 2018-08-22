class CreateBucketItems < ActiveRecord::Migration[5.2]
  def change
    create_table :bucket_items do |t|
      t.string :title
      t.string :description
      t.string :due_date
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
