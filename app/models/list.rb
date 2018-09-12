class List < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  has_many :items

  # def user
end
