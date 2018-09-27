class Activity < ApplicationRecord
  belongs_to :user
  has_many :lists
  has_many :items

  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true

  def formatted_date
    due_date.strftime("%B %d, %Y")
  end

  def countdown
    day_in_seconds = 86400
    dates_difference = (self.due_date.to_time) - (Date.today.to_time)
    (dates_difference/day_in_seconds).to_i
  end

  def mark_complete
    self.update(complete: true)
  end
end
