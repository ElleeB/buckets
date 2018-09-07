class ToDoList < ApplicationRecord
  belongs_to :bucket_item
  belongs_to :user
end
