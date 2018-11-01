class User < ApplicationRecord
  has_secure_password
  has_many :activities
  accepts_nested_attributes_for :activities
  has_many :lists
  has_many :items
  has_many :user_categories
  has_many :categories, through: :user_categories

  validates :name, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :password, length: { :in => 6..20}

  def upcoming_activities
    self.activities.where(complete: false).reject { |activity| activity.countdown > 50 }
  end

  def incomplete_activities
    self.activities.reject { |activity| activity.complete == true }
  end

  def self.most_activities
    # which user_id appears most often in the activities table?
    hash = Activity.order('user_id').group('user_id').count('user_id')
    array = hash.sort_by { |user_id, num_activities| num_activities }
    user_id = array.last[0]
    @user = User.where(id: user_id).to_a.first
  end
end
