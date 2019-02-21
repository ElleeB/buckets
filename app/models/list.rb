class List < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  has_many :items

  accepts_nested_attributes_for :items

  validates :name, uniqueness: true

  def mark_item_complete(id)
    item = Item.find(id)
    item.update!(complete: true)
  end

  def activity_title
    self.activity.title
  end
end
