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
  def countdown_test
    today = Date.today.to_time

    due = "Fri, 31 Aug 2018".to_time

    day = 86400

    puts (due - today)/day
  end


end
