class User < ApplicationRecord
  has_secure_password
  has_many :activities
  # has_many :users_lists
  # has_many :lists, through :users_lists

  validates :name, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :password, length: { :in => 6..20}

  def upcoming_activity_deadlines
    self.activities.reject do |item|
      item.countdown > 50
    end
  end
end
