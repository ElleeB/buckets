class Category < ApplicationRecord
  has_many :activities
  has_many :users, through: :activities

  def self.order_by_name
    order('name')
  end
end
