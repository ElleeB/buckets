class RemoveAboutFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :about
  end
end
