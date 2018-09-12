class List < ApplicationRecord
  belongs_to :activity
  has_many :items

  # def user
end
