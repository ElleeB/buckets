class CreateItemToDos < ActiveRecord::Migration[5.2]
  def change
    create_table :item_to_dos do |t|

      t.timestamps
    end
  end
end
