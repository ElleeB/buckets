class Category < ApplicationRecord
  has_many :users, through: :activities ###
  has_many :activity_categories
  has_many :activities, through: :activity_categories
end
