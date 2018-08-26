class User < ApplicationRecord
  has_secure_password
  has_many :bucket_items

  validates :name, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :password, uniqueness: true, presence: true, length: { :in => 6..20}
end
