class User < ApplicationRecord
  has_secure_password
  has_many :activities
  accepts_nested_attributes_for :activities
  has_many :lists
  has_many :items

  validates :name, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :password, length: { :in => 6..20}

  def upcoming_activities
    self.activities.reject { |activity| activity.countdown > 50 }
  end

  def incomplete_activities
    self.activities.reject { |activity| activity.complete == true }
  end
end
