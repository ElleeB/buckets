class ToDoList < ApplicationRecord
  belongs_to :bucket_item
  has_many :to_do_items
  accepts_nested_attributes_for :to_do_items
end
