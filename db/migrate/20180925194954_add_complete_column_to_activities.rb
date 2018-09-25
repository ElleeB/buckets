class AddCompleteColumnToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :complete, :boolean, default: false
  end
end
