class CreateBucketItems < ActiveRecord::Migration[5.2]
  def change
    create_table :bucket_items do |t|

      t.timestamps
    end
  end
end
