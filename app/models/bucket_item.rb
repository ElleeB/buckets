class BucketItem < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  def formated_date
    due_date.strftime("%B %d, %Y")
  end

  # def refactor_for_calculation(date)
  #   # turn due_date and Date.today = (year, month, day)
  #   date.strftime("%Y, %m, %d")
  # end
  #
  # def countdown
  #   "#{refactor_for_calculation(due_date)}" - "#{refactor_for_calculation(Date.today)}"
  # end
  def countdown
    today_date = Date.today.to_time

    due_date = self.due_date.to_time

    day = 86400

    ((due_date - today_date)/day).to_i
  end

  # def countdown
  #   day_in_seconds = 86400
  #   dates_difference = (Date.today.to_time) - ("Fri, 31 Aug 2018".to_time)
  #   (dates_difference/day_in_seconds).to_i
  # end


end
