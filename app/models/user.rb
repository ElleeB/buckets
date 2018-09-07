class User < ApplicationRecord
  has_secure_password
  has_many :bucket_items
  has_many :to_do_lists
  has_many :to_do_items, through: :to_do_lists

  validates :name, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :password, length: { :in => 6..20}

  def upcoming_bucket_item_deadlines
    self.bucket_items.reject do |item|
      item.countdown > 50
    end
  end
end
