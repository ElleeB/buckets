class BucketItem < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  def formated_date
    due_date.strftime("%B %d, %Y")
  end
end
