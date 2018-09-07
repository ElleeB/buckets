class AddNameToList < ActiveRecord::Migration[5.2]
  def change
    add_column :to_do_lists, :title, :string
  end
end
