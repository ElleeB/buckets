class ChangeUserIdToActivityIdInLists < ActiveRecord::Migration[5.2]
  def change
    rename_column(:lists, :user_id, :activity_id)
  end
end
