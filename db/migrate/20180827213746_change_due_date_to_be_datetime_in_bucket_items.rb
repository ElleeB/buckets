class ChangeDueDateToBeDatetimeInBucketItems < ActiveRecord::Migration[5.2]
  def change
    change_column :bucket_items, :due_date, :datetime
  end
end
