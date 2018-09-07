class RenameItemToItems < ActiveRecord::Migration[5.2]
  def change
    rename_table :item_to_dos, :to_do_items
  end
end
