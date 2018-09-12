class User < ApplicationRecord
  has_secure_password
  has_many :activities
  has_many :lists
  has_many :items

  validates :name, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :password, length: { :in => 6..20}

  def upcoming_activity_deadlines
    self.activities.reject do |item|
      item.countdown > 50
    end
  end

  # def lists

  # def items
end
