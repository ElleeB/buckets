class List < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  has_many :items

  accepts_nested_attributes_for :items

  def mark_item_complete(id)
    item = Item.find(id)
    item.update!(complete: true)
  end
end
