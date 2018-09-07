class CreateItemToDos < ActiveRecord::Migration[5.2]
  def change
    create_table :item_to_dos do |t|
      t.integer :to_do_list_id
      t.string :content
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
