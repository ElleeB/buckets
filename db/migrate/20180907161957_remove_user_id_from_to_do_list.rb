class RemoveUserIdFromToDoList < ActiveRecord::Migration[5.2]
  def change
    remove_column :to_do_lists, :user_id, :integer
  end
end
