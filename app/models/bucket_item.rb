class BucketItem < ApplicationRecord
  belongs_to :user
  has_one :to_do_list
  has_many :to_do_items, through: :to_do_list
  accepts_nested_attributes_for :to_do_items 

  validates :title, presence: true
  validates :description, presence: true

  def formatted_date
    due_date.strftime("%B %d, %Y")
  end

  def countdown
    day_in_seconds = 86400
    dates_difference = (self.due_date.to_time) - (Date.today.to_time)
    (dates_difference/day_in_seconds).to_i
  end
end
