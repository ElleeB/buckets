class CreateToDoLists < ActiveRecord::Migration[5.2]
  def change
    create_table :to_do_lists do |t|
      t.integer :bucket_item_id
      t.integer :user_id


      t.timestamps
    end
  end
end
