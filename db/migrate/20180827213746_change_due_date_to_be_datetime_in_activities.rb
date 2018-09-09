class ChangeDueDateToBeDatetimeInActivities < ActiveRecord::Migration[5.2]
  def change
    change_column :activities, :due_date, :datetime
  end
end
