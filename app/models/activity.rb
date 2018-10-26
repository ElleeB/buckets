class Activity < ApplicationRecord
  belongs_to :user
  has_many :lists
  has_many :items
  has_many :activity_categories
  has_many :categories, through: :activity_categories

  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true
  validate :due_date_cannot_be_in_the_past

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

  def due_date_cannot_be_in_the_past
    if due_date < Date.today
      errors.add(:due_date, "can't be in the past")
    end
  end

  def any_lists?
    !self.lists.empty?
  end
end
