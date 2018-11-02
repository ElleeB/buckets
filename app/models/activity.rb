class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :lists
  has_many :items

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
    if !due_date.nil? && due_date < Date.today
      errors.add(:due_date, "can't be in the past")
    end
  end

  def any_lists?
    !self.lists.empty?
  end

  def category_name
    self.category.name
  end
end
